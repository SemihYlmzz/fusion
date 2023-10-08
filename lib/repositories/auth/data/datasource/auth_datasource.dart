import '../models/auth_model.dart';

abstract class AuthDatasource {
  Future<AuthModel> logInWithGoogle();
  Future<AuthModel> logInWithApple();
  Future<AuthModel> logInWithFacebook();

  Future<void> logOut();
  AuthModel checkUserAuth();
  Stream<AuthModel> get authEntity;
}
