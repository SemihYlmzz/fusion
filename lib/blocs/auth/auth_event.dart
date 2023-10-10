part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent({
    this.errorCleanType = ErrorCleanType.afterDisplay,
  });
  final ErrorCleanType errorCleanType;
}

final class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested({
    super.errorCleanType,
  });
}

final class _AuthUserChanged extends AuthEvent {
  const _AuthUserChanged(this.user);

  final AuthModel user;
}

class LogInWithGoogleRequested extends AuthEvent {
  const LogInWithGoogleRequested({
    super.errorCleanType,
  });
}

class LogInWithAppleRequested extends AuthEvent {
  const LogInWithAppleRequested({
    super.errorCleanType,
  });
}

class LogInWithFacebookRequested extends AuthEvent {
  const LogInWithFacebookRequested({
    super.errorCleanType,
  });
}

class ClearAuthErrorMessageRequested extends AuthEvent {
  const ClearAuthErrorMessageRequested();
}
