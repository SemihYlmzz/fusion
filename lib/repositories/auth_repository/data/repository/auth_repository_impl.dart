import '../../../../utils/typedefs.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authDatasource);
  final AuthDatasource authDatasource;


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
