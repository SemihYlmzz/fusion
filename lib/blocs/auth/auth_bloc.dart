import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/auth_repository/domain/entities/auth_entity.dart';
import '../../repositories/auth_repository/domain/usecase/params/no_params.dart';
import '../../repositories/auth_repository/domain/usecase/usecases/auth_entity.dart';
import '../../repositories/auth_repository/domain/usecase/usecases/check_user_auth.dart';
import '../../repositories/auth_repository/domain/usecase/usecases/log_in_with_apple.dart';
import '../../repositories/auth_repository/domain/usecase/usecases/log_in_with_facebook.dart';
import '../../repositories/auth_repository/domain/usecase/usecases/log_in_with_google.dart';
import '../../repositories/auth_repository/domain/usecase/usecases/log_out.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthEntityUseCase authEntityUseCase,
    required LogOutUseCase logOutUseCase,
    required CheckUserAuthUseCase checkUserAuthUseCase,
    required LoginWithGoogleUseCase loginWithGoogleUseCase,
    required LoginWithAppleUseCase loginWithAppleUseCase,
    required LoginWithFacebookUseCase loginWithFacebookUseCase,
  })  : _loginWithFacebookUseCase = loginWithFacebookUseCase,
        _loginWithAppleUseCase = loginWithAppleUseCase,
        _loginWithGoogleUseCase = loginWithGoogleUseCase,
        _logOutUseCase = logOutUseCase,
        _authEntityUseCase = authEntityUseCase,
        super(
          checkUserAuthUseCase.execute(const NoParams()).isEmpty
              ? const AuthUnAuthenticated()
              : AuthAuthenticated(
                  authEntity: checkUserAuthUseCase.execute(const NoParams()),
                ),
        ) {
    on<_AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<LogInWithGoogleRequested>(_onLogInWithGoogleRequested);
    on<LogInWithAppleRequested>(_onLogInWithAppleRequested);
    on<LogInWithFacebookRequested>(_onLogInWithFacebookRequested);
    on<ClearAuthErrorMessageRequested>(_onClearErrorMessageRequested);

    _authSubscription = _authEntityUseCase.execute(const NoParams()).listen(
      (authEntity) {
        add(_AuthUserChanged(authEntity));
      },
    );
  }
  final AuthEntityUseCase _authEntityUseCase;
  final LogOutUseCase _logOutUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final LoginWithAppleUseCase _loginWithAppleUseCase;
  final LoginWithFacebookUseCase _loginWithFacebookUseCase;

  late final StreamSubscription<AuthEntity> _authSubscription;

  void _onUserChanged(_AuthUserChanged event, Emitter<AuthState> emit) {
    emit(
      event.user.isNotEmpty
          ? AuthAuthenticated(authEntity: event.user)
          : const AuthUnAuthenticated(),
    );
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(authEntity: state.authEntity));
    final tryLogOut = await _logOutUseCase.execute(const NoParams());
    tryLogOut.fold(
      (failure) => emit(
        AuthHasError(
          errorMessage: failure.message,
          authEntity: state.authEntity,
        ),
      ),
      (success) => null,
    );
  }

  Future<void> _onLogInWithGoogleRequested(
    LogInWithGoogleRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final tryLogInWithGoogle = await _loginWithGoogleUseCase.execute(
      const NoParams(),
    );

    tryLogInWithGoogle.fold(
      (failure) {
        emit(AuthHasError(errorMessage: failure.message));
      },
      (authEntity) {
        emit(AuthAuthenticated(authEntity: authEntity));
      },
    );
  }

  Future<void> _onLogInWithAppleRequested(
    LogInWithAppleRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final tryLogInWithApple = await _loginWithAppleUseCase.execute(
      const NoParams(),
    );

    tryLogInWithApple.fold(
      (failure) {
        emit(AuthHasError(errorMessage: failure.message));
      },
      (authEntity) {
        emit(AuthAuthenticated(authEntity: authEntity));
      },
    );
  }

  Future<void> _onLogInWithFacebookRequested(
    LogInWithFacebookRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final tryLogInWithFacebook = await _loginWithFacebookUseCase.execute(
      const NoParams(),
    );

    tryLogInWithFacebook.fold(
      (failure) {
        emit(AuthHasError(errorMessage: failure.message));
      },
      (authEntity) {
        emit(AuthAuthenticated(authEntity: authEntity));
      },
    );
  }

  Future<void> _onClearErrorMessageRequested(
    ClearAuthErrorMessageRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (state.authEntity.isEmpty) {
      emit(const AuthUnAuthenticated());
    } else {
      emit(AuthAuthenticated(authEntity: state.authEntity));
    }
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
