import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/auth_repository/data/datasource/auth_datasource.dart';
import 'package:fusion/repositories/auth_repository/domain/entities/auth_entity.dart';
import 'package:fusion/utils/failure.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
      late final firebase.AuthCredential credential;
      if (kIsWeb) {
        final googleProvider = firebase.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          return Left(Failure('Please give permission to login with Google.'));
        }
        final googleAuth = await googleUser.authentication;

        credential = firebase.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
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
      final errorMessage = LogInWithGoogleFailure.fromCode(e.code).message;
      return Left(Failure(errorMessage));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  FutureEither<AuthEntity> logInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    try {
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
    } catch (exception) {
      return Left(Failure('Error : $exception'));
    }
  }

  @override
  FutureEither<AuthEntity> logInWithFacebook() async {
    try {
      late final firebase.AuthCredential credential;

      if (kIsWeb) {
        final googleProvider = firebase.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
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
      final errorMessage = LogInWithGoogleFailure.fromCode(e.code).message;
      return Left(Failure(errorMessage));
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
        _facebookAuth.logOut()
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

  @override
  FutureEither<String> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return Right(userCredential.user!.uid);
      } else {
        return Left(Failure('Something went wrong'));
      }
    } on firebase.FirebaseAuthException catch (e) {
      final errorMessage =
          SignUpWithEmailAndPasswordFailure.fromCode(e.code).message;
      return Left(Failure(errorMessage));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email or Password is wrong. Please try again.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Email or Password is wrong. Please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}
