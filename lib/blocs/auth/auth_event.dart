part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent({
    this.errorCleanType = ErrorCleanType.immediately,
    this.errorDisplayType = ErrorDisplayType.snackBar,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

final class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class _AuthUserChanged extends AuthEvent {
  const _AuthUserChanged(this.user);

  final AuthModel user;
}

class LogInWithGoogleRequested extends AuthEvent {
  const LogInWithGoogleRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

class LogInWithAppleRequested extends AuthEvent {
  const LogInWithAppleRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

class LogInWithFacebookRequested extends AuthEvent {
  const LogInWithFacebookRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

class ClearAuthErrorMessageRequested extends AuthEvent {
  const ClearAuthErrorMessageRequested();
}
