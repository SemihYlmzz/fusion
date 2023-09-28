import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/auth_entity.dart';

abstract class AuthDatasource {
  FutureEither<AuthEntity> logInWithGoogle();
  FutureEither<AuthEntity> logInWithApple();
  FutureEither<AuthEntity> logInWithFacebook();

  FutureUnit logOut();
  AuthEntity checkUserAuth();
  Stream<AuthEntity> get authEntity;
}
