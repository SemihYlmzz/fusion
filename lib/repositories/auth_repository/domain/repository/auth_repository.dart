import 'package:fusion/repositories/auth_repository/domain/entities/auth_entity.dart';
import 'package:fusion/utils/typedefs.dart';

abstract class AuthRepository {
  FutureEither<String> signUp({
    required String email,
    required String password,
  });
  FutureEither<AuthEntity> logInWithGoogle();
  FutureEither<AuthEntity> logInWithApple();
  FutureEither<AuthEntity> logInWithFacebook();
  FutureUnit logOut();
  AuthEntity checkUserAuth();
  Stream<AuthEntity> get authEntity;
}
