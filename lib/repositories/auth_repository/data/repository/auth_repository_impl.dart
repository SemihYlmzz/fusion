import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:fusion/repositories/auth_repository/data/errors/errors.dart';

import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authDatasource, this.networkInfo);
  final AuthDatasource authDatasource;
  final NetworkInfo networkInfo;

  @override
  FutureEither<AuthEntity> logInWithGoogle() async {
    if (!(await networkInfo.isConnected)) {
      return const Left(Failure.network);
    }
    try {
      final authModel = await authDatasource.logInWithGoogle();
      return Right(authModel);
    } on LogInWithGoogleExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  FutureEither<AuthEntity> logInWithApple() async {
    if (!(await networkInfo.isConnected)) {
      return const Left(Failure.network);
    }
    try {
      final authModel = await authDatasource.logInWithApple();
      return Right(authModel);
    } on LogInWithAppleExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  FutureEither<AuthEntity> logInWithFacebook() async {
    if (!(await networkInfo.isConnected)) {
      return const Left(Failure.network);
    }
    try {
      final authModel = await authDatasource.logInWithFacebook();
      return Right(authModel);
    } on LogInWithFacebookExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  FutureUnit logOut() async {
    if (!(await networkInfo.isConnected)) {
      return const Left(Failure.network);
    }
    try {
      await authDatasource.logOut();
      return const Right(unit);
    } on LogOutExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  AuthEntity checkUserAuth() {
    try {
      return authDatasource.checkUserAuth();
    } on CheckUserException {
      return AuthEntity.empty;
    }
  }

  @override
  Stream<AuthEntity> get authEntity {
    return authDatasource.authEntity;
  }
}
