import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failure/failure.dart';
import '../domain/entities/user.dart';
import '../domain/usecase/params/no_params.dart';
import '../domain/usecase/params/uid_params.dart';
import '../domain/usecase/params/user_name_params.dart';
import '../domain/usecase/usecases/change_username.dart';
import '../domain/usecase/usecases/read_user_with_uid.dart';
import '../domain/usecase/usecases/refresh_deck.dart';
import '../domain/usecase/usecases/watch_user_with_uid.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with ChangeNotifier {
  UserBloc({
    required this.readUserWithUidUseCase,
    required this.watchUserWithUidUseCase,
    required this.changeUsernameUseCase,
    required this.refreshDeckUseCase,
  }) : super(const UserEmpty()) {
    on<ReadWithUidRequested>(onReadWithUidRequested);
    on<WatchWithUidRequested>(onUserWatchRequested);
    on<ChangeUsernameRequested>(onUsernameChangeRequested);
    on<RefreshDeckRequested>(onRefreshDeckRequested);
    on<StopWatchingUserRequested>(onStopWatchingUserRequested);
  }
  final ReadUserWithUidUseCase readUserWithUidUseCase;
  final WatchUserWithUidUseCase watchUserWithUidUseCase;
  final ChangeUsernameUseCase changeUsernameUseCase;
  final RefreshDeckUseCase refreshDeckUseCase;

  StreamSubscription<Either<Failure, User>>? _userSubscription;

  Future<void> onReadWithUidRequested(
    ReadWithUidRequested event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserHasData) {
      return;
    }
    emit(const UserInitializing());
    final tryReadUser = await readUserWithUidUseCase.execute(
      UidParams(uid: event.uid),
    );

    tryReadUser.fold(
      (failure) {
        emit(UserEmpty(errorMessage: failure.message));
      },
      (userEntity) {
        userEntity != null
            ? emit(UserHasData(user: userEntity))
            : emit(const UserEmpty());
      },
    );
  }

  Future<void> onUserWatchRequested(
    WatchWithUidRequested event,
    Emitter<UserState> emit,
  ) async {
    await _userSubscription?.cancel();
    emit(UserLoading(user: state.user));

    _userSubscription =
        watchUserWithUidUseCase.execute(NoParams()).listen((event) {
      event.fold(
        (failure) {
          emit(UserHasData(user: state.user, errorMessage: failure.message));
        },
        (user) {
          emit(UserHasData(user: user));
        },
      );
    });

    await _userSubscription?.asFuture<void>();
  }

  Future<void> onUsernameChangeRequested(
    ChangeUsernameRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(UserLoading(user: state.user));
    final tryUpdateUser = await changeUsernameUseCase.execute(
      UsernameParams(username: event.newUsername),
    );
    tryUpdateUser.fold(
      (failure) => emit(
        UserHasData(
          user: oldState.user,
          errorMessage: failure.message,
        ),
      ),
      (userEntity) => emit(
        UserHasData(
          user: oldState.user?.copyWith(
            username: event.newUsername,
            accountnameChangeEligibilityDate: DateTime.now().add(
              const Duration(days: 30),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onRefreshDeckRequested(
    RefreshDeckRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(UserLoading(user: state.user));
    final tryUpdateUser = await refreshDeckUseCase.execute(NoParams());
    tryUpdateUser.fold(
      (failure) => emit(
        UserHasData(
          user: oldState.user,
          errorMessage: failure.message,
        ),
      ),
      (userEntity) => add(ReadWithUidRequested(oldState.user!.uid)),
    );
  }

  Future<void> onStopWatchingUserRequested(
    StopWatchingUserRequested event,
    Emitter<UserState> emit,
  ) async {
    await _userSubscription?.cancel();
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _userSubscription = null;
    return super.close();
  }
}
