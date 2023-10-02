import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/errors/exceptions/exceptions.dart';
import '../models/auth_model.dart';
import 'auth_datasource.dart';

class AuthDatasourceFirebaseImpl implements AuthDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  @override
  Stream<AuthModel> get authEntity {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? AuthModel.empty
          : AuthModel.fromFirebaseUser(firebaseUser);
    });
  }

  @override
  Future<AuthModel> logInWithGoogle() async {
    try {
      await logOut();

      final AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw const ServerException(
          message: 'Error occured while loggining with Google.',
        );
      }

      final googleAuth = await googleUser.authentication;

      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      if (userCredential.user != null) {
        return AuthModel.fromFirebaseUser(userCredential.user!);
      } else {
        throw const ServerException(
          message: "User couldn't sign in with credential.",
        );
      }
    } catch (e) {
      //! EXEPTIONS
      // [Logout] Function Exceptions
      //
      if (e is ServerException) {
        rethrow;
      }
      // [_googleSignIn.signIn] Function Exceptions
      //
      if (e is PlatformException) {
        if (e.code == GoogleSignIn.kNetworkError) {
          throw const NetworkException();
        }
        if (e.code == GoogleSignIn.kSignInCanceledError) {
          throw const ServerException(
            message: 'Google sign in canceled by the user.',
          );
        }
        if (e.code == GoogleSignIn.kSignInFailedError) {
          throw const ServerException(
            message: 'Google sign in failed. Please try again.',
          );
        }
        if (e.code == GoogleSignIn.kSignInRequiredError) {
          throw const ServerException(
            message: 'Please sign in to your Google account to continue.',
          );
        } else {
          throw ServerException(
            message: 'Unknown Google sign in error occured. Code:${e.code}',
          );
        }
      }
      if (e is StateError) {
        throw ServerException(message: e.message);
      }
      // [FirebaseAuth.signInWithCredential] Function Exeptions
      //
      if (e is FirebaseAuthException) {
        throw ServerException(
          message: _firebaseAuthExceptionToFailureMessage(e),
        );
      }
      // Caught Unexpected Exeptions
      //
      throw const ServerException(
        message: 'Unknown Google sign in error occured.',
      );
    }
  }

  @override
  Future<AuthModel> logInWithApple() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);
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

      final firebaseUser = authResult.user;
      if (firebaseUser == null) {
        throw const ServerException(
          message: 'Error occured while loggining with Apple.',
        );
      }
      final displayName =
          '${appleCredential.givenName} ${appleCredential.familyName}';
      final userEmail = appleCredential.email;

      if (userEmail == null) {
        throw const ServerException(
          message:
              "User's email not received. Apple sign in could not completed.",
        );
      }
      await firebaseUser.updateDisplayName(displayName);
      await firebaseUser.updateEmail(userEmail);

      return AuthModel.fromFirebaseUser(firebaseUser);
    } catch (e) {
      //! EXEPTIONS
      // [Logout] Function Exceptions
      //
      if (e is ServerException) {
        rethrow;
      }
      // [SignInWithApple.getAppleIDCredential] Function Exceptions
      //
      if (e is SignInWithAppleException) {
        throw const ServerException(
          message: "Apple sign in couldn't complete succesfully.",
        );
      }

      // [FirebaseAuth.signInWithCredential] Function Exeptions
      //
      if (e is FirebaseAuthException) {
        throw ServerException(
          message: _firebaseAuthExceptionToFailureMessage(e),
        );
      }
      // Caught Unexpected Exeptions
      //
      throw const ServerException(
        message: 'Unknown Apple sign in error occured.',
      );
    }
  }

  @override
  Future<AuthModel> logInWithFacebook() async {
    try {
      final AuthCredential credential;
      await logOut();

      final loginResult = await _facebookAuth.login();

      if (loginResult.accessToken == null) {
        throw const ServerException(
          message: 'Facebook login request failed.',
        );
      }

      credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.token,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user == null) {
        throw const ServerException(
          message: 'Error occured while loggining with Facebook.',
        );
      }
      return AuthModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      //! EXEPTIONS
      // [Logout] Function Exceptions
      //
      if (e is ServerException) {
        rethrow;
      }

      // [FirebaseAuth.signInWithCredential] Function Exeptions
      //
      if (e is FirebaseAuthException) {
        throw ServerException(
          message: _firebaseAuthExceptionToFailureMessage(e),
        );
      }
      // Caught Unexpected Exeptions
      //
      throw const ServerException(
        message: 'Unknown Facebook sign in error occured.',
      );
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
        _facebookAuth.logOut(),
      ]);
      return;
    } catch (e) {
      throw const ServerException(
        message: 'Unknown error occured while logging out.',
      );
    }
  }

  @override
  AuthModel checkUserAuth() {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      return AuthModel.fromFirebaseUser(currentUser);
    } else {
      throw const ServerException(
        message: 'User is not logged in currently.',
      );
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  String _firebaseAuthExceptionToFailureMessage(
    FirebaseAuthException firebaseAuthException,
  ) {
    return switch (firebaseAuthException.code) {
      'account-exists-with-different-credential' =>
        'Account exists with different credentials.',
      'invalid-credential' =>
        'The credential received is malformed or has expired.',
      'operation-not-allowed' =>
        'Operation is not allowed.  Please contact support.',
      'user-disabled' =>
        'This user has been disabled. Please contact support for help.',
      'user-not-found' => 'Email is not found, please create an account.',
      'wrong-password' => 'Incorrect password, please try again.',
      'invalid-verification-code' =>
        'The credential verification code received is invalid.',
      'invalid-verification-id' =>
        'The credential verification ID received is invalid.',
      _ => 'An unknown exception occurred.'
    };
  }
}
