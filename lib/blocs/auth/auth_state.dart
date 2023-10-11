part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState({
    this.errorMessage,
    this.authEntity = AuthModel.empty,
  });
  final String? errorMessage;
  final AuthModel authEntity;
  @override
  List<Object?> get props => [errorMessage, authEntity];
}

class AuthUnAuthenticated extends AuthState {
  const AuthUnAuthenticated({super.authEntity});
}

class AuthLoading extends AuthState {
  const AuthLoading({super.authEntity});
}

class AuthHasError extends AuthState {
  const AuthHasError({
    required super.errorMessage,
    required this.errorCleanType,
    required this.errorDisplayType,
    super.authEntity,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required super.authEntity});
}
