part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState({
    this.errorMessage,
    this.authEntity = AuthEntity.empty,
  });
  final String? errorMessage;
  final AuthEntity authEntity;
  @override
  List<Object?> get props => [errorMessage];
}

class AuthUnAuthenticated extends AuthState {
  const AuthUnAuthenticated({super.authEntity});
}

class AuthLoading extends AuthState {
  const AuthLoading({super.authEntity});
}

class AuthHasError extends AuthState {
  const AuthHasError({required super.errorMessage, super.authEntity});
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required super.authEntity});
}
