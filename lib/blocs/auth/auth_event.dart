part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

final class _AuthUserChanged extends AuthEvent {
  const _AuthUserChanged(this.user);

  final AuthModel user;
}

class LogInWithGoogleRequested extends AuthEvent {
  const LogInWithGoogleRequested();
}
class LogInWithAppleRequested extends AuthEvent {
  const LogInWithAppleRequested();
}
class LogInWithFacebookRequested extends AuthEvent {
  const LogInWithFacebookRequested();
}
class ClearAuthErrorMessageRequested extends AuthEvent {
  const ClearAuthErrorMessageRequested();
}
