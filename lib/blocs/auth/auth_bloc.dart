import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fusion/repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(
          authRepository.checkUserAuth().isEmpty
              ? AuthUnAuthenticated()
              : AuthAuthenticated(
                  authEntity: authRepository.checkUserAuth(),
                ),
        ) {
    on<_AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<LogInWithGoogleRequested>(_onLogInWithGoogleRequested);
    on<LogInWithAppleRequested>(_onLogInWithAppleRequested);
    on<LogInWithFacebookRequested>(_onLogInWithFacebookRequested);
    on<ClearAuthErrorMessageRequested>(_onClearErrorMessageRequested);

    _authSubscription = _authRepository.authEntity.listen(
      (authEntity) {
        add(_AuthUserChanged(authEntity));
      },
    );
  }
  final AuthRepository _authRepository;

  late final StreamSubscription<AuthModel> _authSubscription;

  void _onUserChanged(_AuthUserChanged event, Emitter<AuthState> emit) {
    emit(
      event.user.isNotEmpty
          ? AuthAuthenticated(authEntity: event.user)
          : AuthUnAuthenticated(),
    );
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(authEntity: state.authEntity));
    final tryLogOut = await _authRepository.logOut();
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
    emit(AuthLoading());

    final tryLogInWithGoogle = await _authRepository.logInWithGoogle();

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
    emit(AuthLoading());

    final tryLogInWithApple = await _authRepository.logInWithApple();

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
    emit(AuthLoading());

    final tryLogInWithFacebook = await _authRepository.logInWithFacebook();

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
      emit(AuthUnAuthenticated());
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
