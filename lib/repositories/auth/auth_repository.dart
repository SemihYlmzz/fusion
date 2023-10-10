import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:fusion/repositories/auth/errors/errors.dart';
import 'package:fusion/repositories/auth/models/auth_model.dart';

import '../../core/typedefs/typedefs.dart';
import 'auth_datasource.dart';

class AuthRepository {
  AuthRepository(this._authDatasource, this._networkInfo);

  final AuthDatasource _authDatasource;
  final NetworkInfo _networkInfo;

  FutureEither<AuthModel> logInWithGoogle() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      final authModel = await _authDatasource.logInWithGoogle();
      return Right(authModel);
    } on LogInWithGoogleExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  FutureEither<AuthModel> logInWithApple() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      final authModel = await _authDatasource.logInWithApple();
      return Right(authModel);
    } on LogInWithAppleExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  FutureEither<AuthModel> logInWithFacebook() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      final authModel = await _authDatasource.logInWithFacebook();
      return Right(authModel);
    } on LogInWithFacebookExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  FutureUnit logOut() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      await _authDatasource.logOut();
      return const Right(unit);
    } on LogOutExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  AuthModel checkUserAuth() {
    try {
      return _authDatasource.checkUserAuth();
    } on CheckUserException {
      return AuthModel.empty;
    }
  }

  Stream<AuthModel> get authEntity {
    return _authDatasource.authEntity;
  }
}
