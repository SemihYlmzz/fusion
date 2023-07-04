import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fusion/repositories/auth_repository/domain/entities/auth_entity.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/params/no_params.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/auth_entity.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/check_user_auth.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/log_in_with_apple.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/log_in_with_facebook.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/log_in_with_google.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/log_out.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.authEntityUseCase,
    required this.logOutUseCase,
    required this.checkUserAuthUseCase,
    required this.loginWithGoogleUseCase,
    required this.loginWithAppleUseCase,
    required this.loginWithFacebookUseCase,
  }) : super(
          checkUserAuthUseCase.execute(const NoParams()).isEmpty
              ? const AuthUnAuthenticated()
              : AuthAuthenticated(
                  authEntity: checkUserAuthUseCase.execute(const NoParams()),
                ),
        ) {
    on<_AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<LogInWithGoogleRequested>(onLogInWithGoogleRequested);
    on<LogInWithAppleRequested>(onLogInWithAppleRequested);
    on<LogInWithFacebookRequested>(onLogInWithFacebookRequested);

    _authSubscription = authEntityUseCase.execute(const NoParams()).listen(
      (authEntity) {
        add(_AuthUserChanged(authEntity));
      },
    );
  }
  final AuthEntityUseCase authEntityUseCase;
  final LogOutUseCase logOutUseCase;
  final CheckUserAuthUseCase checkUserAuthUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LoginWithAppleUseCase loginWithAppleUseCase;
  final LoginWithFacebookUseCase loginWithFacebookUseCase;

  late final StreamSubscription<AuthEntity> _authSubscription;

  void _onUserChanged(_AuthUserChanged event, Emitter<AuthState> emit) {
    emit(
      event.user.isNotEmpty
          ? AuthAuthenticated(authEntity: event.user)
          : const AuthUnAuthenticated(),
    );
  }

  void _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) {
    unawaited(logOutUseCase.execute(const NoParams()));
  }


  Future<void> onLogInWithGoogleRequested(
    LogInWithGoogleRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final tryLogInWithGoogle = await loginWithGoogleUseCase.execute(
      const NoParams(),
    );

    tryLogInWithGoogle.fold(
      (failure) {
        emit(AuthUnAuthenticated(errorMessage: failure.message));
      },
      (authEntity) {
        emit(AuthAuthenticated(authEntity: authEntity));
      },
    );
  }

  Future<void> onLogInWithAppleRequested(
    LogInWithAppleRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final tryLogInWithApple = await loginWithAppleUseCase.execute(
      const NoParams(),
    );

    tryLogInWithApple.fold(
      (failure) {
        emit(AuthUnAuthenticated(errorMessage: failure.message));
      },
      (authEntity) {
        emit(AuthAuthenticated(authEntity: authEntity));
      },
    );
  }

  Future<void> onLogInWithFacebookRequested(
    LogInWithFacebookRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final tryLogInWithFacebook = await loginWithFacebookUseCase.execute(
      const NoParams(),
    );

    tryLogInWithFacebook.fold(
      (failure) {
        emit(AuthUnAuthenticated(errorMessage: failure.message));
      },
      (authEntity) {
        emit(AuthAuthenticated(authEntity: authEntity));
      },
    );
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
