part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState({
    this.errorMessage,
    this.authEntity = AuthModel.empty,
  });
  final String? errorMessage;
  final AuthModel authEntity;

  AuthState copyWith({
    String? errorMessage,
    AuthModel? authEntity,
  });

  @override
  List<Object?> get props => [errorMessage, authEntity];
}

class AuthUnAuthenticated extends AuthState {
  const AuthUnAuthenticated({super.authEntity});

  @override
  AuthState copyWith({
    String? errorMessage,
    AuthModel? authEntity,
  }) {
    return  AuthUnAuthenticated(authEntity: authEntity ?? this.authEntity);
  }
}

class AuthLoading extends AuthState {
  const AuthLoading({super.authEntity});
  @override
  AuthState copyWith({
    String? errorMessage,
    AuthModel? authEntity,
  }) {
    return  AuthLoading(authEntity: authEntity ?? this.authEntity);
  }
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

  @override
  AuthState copyWith({
    String? errorMessage,
    AuthModel? authEntity,
    ErrorCleanType? errorCleanType,
    ErrorDisplayType? errorDisplayType,
  }) {
    return AuthHasError(
      errorMessage: errorMessage ?? this.errorMessage,
      authEntity: authEntity ?? this.authEntity,
      errorCleanType: errorCleanType ?? this.errorCleanType,
      errorDisplayType: errorDisplayType ?? this.errorDisplayType,
    );
  }
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required super.authEntity});

  @override
  AuthState copyWith({
    String? errorMessage,
    AuthModel? authEntity,
  }) {
    return AuthAuthenticated(authEntity: authEntity ?? this.authEntity);
  }
}
