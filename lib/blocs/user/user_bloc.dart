import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../core/errors/failure/failure.dart';
import '../../repositories/repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with ChangeNotifier {
  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const UserEmpty()) {
    on<ReadWithUidRequested>(_onReadWithUidRequested);
    on<WatchWithUidRequested>(_onUserWatchRequested);
    on<ChangeUsernameRequested>(_onUsernameChangeRequested);
    on<RefreshDeckRequested>(_onRefreshDeckRequested);
    on<StopWatchingUserRequested>(_onStopWatchingUserRequested);
    on<ClearUserErrorMessageRequested>(_onClearUserErrorMessageRequested);
    on<ClearUserRequested>(_onClearUserRequested);
  }
  final UserRepository _userRepository;

  StreamSubscription<Either<Failure, UserModel>>? _userSubscription;

  Future<void> _onReadWithUidRequested(
    ReadWithUidRequested event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserHasData) {
      return;
    }
    emit(const UserLoading());
    final tryReadUser = await _userRepository.readUserWithUid(uid: event.uid);

    tryReadUser.fold(
      (failure) {
        emit(
          UserHasError(
            errorDisplayType: event.errorDisplayType,
            errorCleanType: event.errorCleanType,
            errorMessage: failure.message,
          ),
        );
      },
      (userEntity) {
        userEntity != null
            ? emit(UserHasData(userModel: userEntity))
            : emit(const UserEmpty());
      },
    );
  }

  Future<void> _onUserWatchRequested(
    WatchWithUidRequested event,
    Emitter<UserState> emit,
  ) async {
    await _userSubscription?.cancel();

    _userSubscription = _userRepository.watchUserWithUid().listen((result) {
      result.fold(
        (failure) {
          _userSubscription = null;

          emit(
            UserHasError(
              errorDisplayType: event.errorDisplayType,
              errorCleanType: event.errorCleanType,
              errorMessage: failure.message,
              userModel: state.userModel,
            ),
          );
        },
        (user) {
          state is UserHasData
              ? emit(state.copyWith(userModel: user))
              : emit(UserHasData(userModel: user));
        },
      );
    });

    await _userSubscription?.asFuture<void>();
  }

  Future<void> _onUsernameChangeRequested(
    ChangeUsernameRequested event,
    Emitter<UserState> emit,
  ) async {
    final tryUpdateUser = await _userRepository.changeUsername(
      newUsername: event.newUsername,
    );
    tryUpdateUser.fold(
      (failure) => emit(
        UserHasError(
          errorDisplayType: event.errorDisplayType,
          errorCleanType: event.errorCleanType,
          userModel: state.userModel,
          errorMessage: failure.message,
        ),
      ),
      (success) => emit(
        state.copyWith(
          userModel: state.userModel?.copyWith(
            username: event.newUsername,
            accountnameChangeEligibilityDate: DateTime.now().add(
              const Duration(days: 30),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefreshDeckRequested(
    RefreshDeckRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(UserLoading(userModel: state.userModel));
    final tryRefreshDeck = await _userRepository.refreshDeck();
    tryRefreshDeck.fold(
      (failure) => emit(
        UserHasError(
          errorDisplayType: event.errorDisplayType,
          errorCleanType: event.errorCleanType,
          userModel: oldState.userModel,
          errorMessage: failure.message,
        ),
      ),
      (success) => add(
        ReadWithUidRequested(
          uid: oldState.userModel!.uid,
        ),
      ),
    );
  }

  Future<void> _onStopWatchingUserRequested(
    StopWatchingUserRequested event,
    Emitter<UserState> emit,
  ) async {
    await _userSubscription?.cancel();
  }

  Future<void> _onClearUserErrorMessageRequested(
    ClearUserErrorMessageRequested event,
    Emitter<UserState> emit,
  ) async {
    if (state.userModel == null) {
      emit(const UserEmpty());
    } else {
      emit(UserHasData(userModel: state.userModel));
    }
  }

  Future<void> _onClearUserRequested(
    ClearUserRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserEmpty());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _userSubscription = null;
    return super.close();
  }
}
