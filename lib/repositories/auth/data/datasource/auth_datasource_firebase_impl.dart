import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fusion/repositories/auth/data/errors/check_user_auth_exceptions.dart';
import 'package:fusion/repositories/auth/data/errors/log_in_with_apple_exceptions.dart';
import 'package:fusion/repositories/auth/data/errors/log_in_with_facebook_exceptions.dart';
import 'package:fusion/repositories/auth/data/errors/log_in_with_google_exceptions.dart';
import 'package:fusion/repositories/auth/data/errors/log_out_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
      // Logged in users can't login again,
      // so we force User to logOut.
      await logOut();

      // We need a credential variable to sign in with [FirebaseAuth],
      // so we define one to use later on.
      final AuthCredential credential;

      // [AuthCredential] needs [idToken] and [accessToken]
      // First step of getting them [GoogleSignInAccount]
      // so we trying to made User sign in with Google account.
      // and holding [GoogleSignInAccount] in [googleUser] variable.
      //
      // [google_sign_in] package used for this.
      final googleUser = await _googleSignIn.signIn();

      // If [googleUser] is null. We can't take [accessToken] and [idToken]
      // so we ensure that the [googleUser] is not null.
      if (googleUser == null) {
        throw LogInWithGoogleExceptions.logInFailed;
      }

      // We authenticate [googleUser] and get [GoogleSignInAuthentication]
      // which contains both [accessToken] and [idToken]
      //
      // [google_sign_in] package used for this.
      final googleAuth = await googleUser.authentication;

      // If [accessToken] and [idToken] is null, [FirebaseAuth] cant sign in.
      // so we ensure that the [accessToken] and [idToken] is not null.
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw LogInWithGoogleExceptions.logInFailed;
      }
      // We are setting up [AuthCredential] to use it.
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Executing the [FirebaseAuth]'s sign in with credential function.
      // with the [credential] which we add [accessToken] and [idToken] in it.
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      // [this] function needs to return [UserModel],
      // so we checking the [UserCredential]'s user parameter if it's null
      // before returning it directly.
      if (userCredential.user == null) {
        throw LogInWithGoogleExceptions.logInFailed;
      }

      // After ensure [UserCredential]'s user parameter is not null,
      // we can transform [User] class to our [UserModel] class and return it.
      return AuthModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      if (e is LogInWithGoogleExceptions) {
        rethrow;
      }
      if (e is LogOutExceptions) {
        throw LogInWithGoogleExceptions.logInFailed;
      }
      // [_googleSignIn.signIn] Function can throw PlatformException
      // we are catching the error code and throwing our own Exception
      if (e is PlatformException) {
        if (e.code == GoogleSignIn.kSignInCanceledError) {
          throw LogInWithGoogleExceptions.empty;
        }
      }
      // [FirebaseAuth]'s signInWithCredential Function
      // throws a [FirebaseAuthException]
      // we are catching the error code and throwing our own Exception
      if (e is FirebaseAuthException) {
        throw LogInWithGoogleExceptions(
          message: _firebaseAuthExceptionToFailureMessage(e),
        );
      }
      // If none of expected exceptions throwed.
      // We are throwing an [UnknownException]
      throw LogInWithGoogleExceptions.unknown;
    }
  }

  @override
  Future<AuthModel> logInWithApple() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);
    const appleProviderId = 'apple.com';

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

      final oauthCredential = OAuthProvider(appleProviderId).credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final authResult =
          await _firebaseAuth.signInWithCredential(oauthCredential);

      final firebaseUser = authResult.user;
      if (firebaseUser == null) {
        throw LogInWithAppleExceptions.logInFailed;
      }
      final displayName =
          '${appleCredential.givenName} ${appleCredential.familyName}';
      final userEmail = appleCredential.email;

      if (userEmail == null) {
        throw LogInWithAppleExceptions.logInFailed;
      }
      await firebaseUser.updateDisplayName(displayName);
      await firebaseUser.updateEmail(userEmail);

      return AuthModel.fromFirebaseUser(firebaseUser);
    } catch (e) {
      if (e is LogInWithAppleExceptions) {
        rethrow;
      }
      if (e is LogOutExceptions) {
        throw LogInWithAppleExceptions.logInFailed;
      }
      if (e is SignInWithAppleAuthorizationException) {
        if (e.code == AuthorizationErrorCode.canceled) {
          throw LogInWithAppleExceptions.empty;
        }
      }
      if (e is FirebaseAuthException) {
        throw LogInWithAppleExceptions(
          message: _firebaseAuthExceptionToFailureMessage(e),
        );
      }
      throw LogInWithAppleExceptions.unknown;
    }
  }

  @override
  Future<AuthModel> logInWithFacebook() async {
    try {
      final AuthCredential credential;
      await logOut();

      final loginResult = await _facebookAuth.login();

      if (loginResult.accessToken == null) {
        throw LogInWithFacebookExceptions.logInFailed;
      }

      credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.token,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user == null) {
        throw LogInWithFacebookExceptions.logInFailed;
      }
      return AuthModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      if (e is LogInWithFacebookExceptions) {
        rethrow;
      }
      if (e is LogOutExceptions) {
        throw LogInWithFacebookExceptions.logInFailed;
      }
      // [FirebaseAuth.signInWithCredential] Function Exeptions
      //
      if (e is FirebaseAuthException) {
        throw LogInWithFacebookExceptions(
          message: _firebaseAuthExceptionToFailureMessage(e),
        );
      }
      // Caught Unexpected Exeptions
      //
      throw LogInWithFacebookExceptions.unknown;
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
      throw LogOutExceptions.unknown;
    }
  }

  @override
  AuthModel checkUserAuth() {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      return AuthModel.fromFirebaseUser(currentUser);
    } else {
      throw CheckUserException.empty;
    }
  }

  String _firebaseAuthExceptionToFailureMessage(
    FirebaseAuthException firebaseAuthException,
  ) {
    switch (firebaseAuthException.code) {
      case 'account-exists-with-different-credential':
        return 'Account exists with different credentials.';
      case 'invalid-credential':
        return 'The credential received is malformed or has expired.';
      case 'operation-not-allowed':
        return 'Operation is not allowed.  Please contact support.';
      case 'user-disabled':
        return 'This user has been disabled. Please contact support for help.';
      case 'user-not-found':
        return 'Email is not found, please create an account.';
      case 'wrong-password':
        return 'Incorrect password, please try again.';
      case 'invalid-verification-code':
        return 'The credential verification code received is invalid.';
      case 'invalid-verification-id':
        return 'The credential verification ID received is invalid.';
      default:
        return 'An unknown exception occurred.';
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
}
