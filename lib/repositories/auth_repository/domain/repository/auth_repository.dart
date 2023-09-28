import '../../../../core/typedefs/typedefs.dart';
import '../entities/auth_entity.dart';

abstract class AuthRepository {
  FutureEither<AuthEntity> logInWithGoogle();
  FutureEither<AuthEntity> logInWithApple();
  FutureEither<AuthEntity> logInWithFacebook();
  FutureUnit logOut();
  AuthEntity checkUserAuth();
  Stream<AuthEntity> get authEntity;
}
