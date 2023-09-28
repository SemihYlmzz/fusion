import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/auth_entity.dart';
import 'auth_datasource.dart';

class AuthDatasourceFirebaseImpl implements AuthDatasource {
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Stream<AuthEntity> get authEntity {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? AuthEntity.empty
          : AuthEntity(
              id: firebaseUser.uid,
              email: firebaseUser.email,
              name: firebaseUser.displayName,
              photo: firebaseUser.photoURL,
            );
    });
  }

  @override
  FutureEither<AuthEntity> logInWithGoogle() async {
    try {
      await logOut();

      // Google Credential variable to hold user data
      late final firebase.AuthCredential credential;

      // Try sign in with Google and take googleUser value
      final googleUser = await _googleSignIn.signIn();

      // If google user null at this point
      // it means user didn't give permission
      // So we return an error to user
      if (googleUser == null) {
        return Left(Failure('Please give permission to login with Google.'));
      }

      // It is googleUser variable not null.
      // we taking [GoogleSignInAuthentication] from it as [googleAuth]
      final googleAuth = await googleUser.authentication;

      // We are creating a [GoogleAuthProvider.credential] with [googleAuth]
      credential = firebase.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Now we can user Firebase's [signInWithCredential] method
      // using with [GoogleAuthProvider.credential] which we created above
      // and getting [UserCredential] variable with it
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Last check if user parameter in [UserCredential] is null or not
      // if it's not null it means we got all [User] data in it
      if (userCredential.user != null) {
        return Right(
          AuthEntity(
            id: userCredential.user!.uid,
            email: userCredential.user!.email,
            name: userCredential.user!.displayName,
            photo: userCredential.user!.photoURL,
          ),
        );
      } else {
        // if somehow [User] is empty we return a empty [AuthEntity] back
        return const Right(AuthEntity.empty);
      }
    } on firebase.FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? 'An Unknown Error Occurred.'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  FutureEither<AuthEntity> logInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    try {
      await logOut();

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final authResult =
          await _firebaseAuth.signInWithCredential(oauthCredential);

      final displayName =
          '${appleCredential.givenName} ${appleCredential.familyName}';
      final userEmail = appleCredential.email;

      final firebaseUser = authResult.user;

      if (userEmail != null) {
        await firebaseUser?.updateEmail(userEmail);
      }
      await firebaseUser?.updateDisplayName(displayName);

      return Right(
        AuthEntity(
          id: firebaseUser!.uid,
          email: firebaseUser.email,
          name: firebaseUser.displayName,
          photo: firebaseUser.photoURL,
        ),
      );
    } on firebase.FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? 'An Unknown Error Occurred.'));
    } catch (exception) {
      return Left(Failure('Error : $exception'));
    }
  }

  @override
  FutureEither<AuthEntity> logInWithFacebook() async {
    try {
      late final firebase.AuthCredential credential;
      await logOut();

      if (kIsWeb) {
        final facebookProvider = firebase.FacebookAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          facebookProvider,
        );
        credential = userCredential.credential!;
      } else {
        final loginResult = await FacebookAuth.instance
            .login(permissions: ['email', 'public_profile']);
        if (loginResult.accessToken == null) {
          return Left(
            Failure('Something went wrong while login with Facebook.'),
          );
        }

        credential = firebase.FacebookAuthProvider.credential(
          loginResult.accessToken!.token,
        );
      }

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.user != null) {
        return Right(
          AuthEntity(
            id: userCredential.user!.uid,
            email: userCredential.user!.email,
            name: userCredential.user!.displayName,
            photo: userCredential.user!.photoURL,
          ),
        );
      } else {
        return const Right(AuthEntity.empty);
      }
    } on firebase.FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? 'An Unknown Error Occurred.'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  FutureUnit logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
        _facebookAuth.logOut(),
      ]);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  AuthEntity checkUserAuth() {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      return AuthEntity(
        id: currentUser.uid,
        email: currentUser.email,
        name: currentUser.displayName,
        photo: currentUser.photoURL,
      );
    } else {
      return AuthEntity.empty;
    }
  }
}
