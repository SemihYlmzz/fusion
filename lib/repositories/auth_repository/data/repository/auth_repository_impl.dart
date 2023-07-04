import 'package:fusion/repositories/auth_repository/data/datasource/auth_datasource.dart';
import 'package:fusion/repositories/auth_repository/domain/entities/auth_entity.dart';
import 'package:fusion/repositories/auth_repository/domain/repository/auth_repository.dart';
import 'package:fusion/utils/typedefs.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authDatasource);
  final AuthDatasource authDatasource;

  @override
  FutureEither<String> signUp({
    required String email,
    required String password,
  }) {
    return authDatasource.signUp(
      email: email,
      password: password,
    );
  }

  @override
  FutureEither<AuthEntity> logInWithGoogle() {
    return authDatasource.logInWithGoogle();
  }

  @override
  FutureEither<AuthEntity> logInWithApple() {
    return authDatasource.logInWithApple();
  }

  @override
  FutureEither<AuthEntity> logInWithFacebook() {
    return authDatasource.logInWithFacebook();
  }

  @override
  FutureUnit logOut() {
    return authDatasource.logOut();
  }

  @override
  AuthEntity checkUserAuth() {
    return authDatasource.checkUserAuth();
  }

  @override
  Stream<AuthEntity> get authEntity {
    return authDatasource.authEntity;
  }
}
