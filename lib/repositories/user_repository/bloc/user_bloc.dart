import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../utils/failure.dart';
import '../domain/entities/user.dart';
import '../domain/usecase/params/no_params.dart';
import '../domain/usecase/params/uid_params.dart';
import '../domain/usecase/params/user_name_params.dart';
import '../domain/usecase/usecases/change_username.dart';
import '../domain/usecase/usecases/create_user.dart';
import '../domain/usecase/usecases/delete_user.dart';
import '../domain/usecase/usecases/read_user_with_uid.dart';
import '../domain/usecase/usecases/refresh_deck.dart';
import '../domain/usecase/usecases/update_user_with_uid.dart';
import '../domain/usecase/usecases/watch_user_with_uid.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with ChangeNotifier {
  UserBloc({
    required this.createUserUseCase,
    required this.readUserWithUidUseCase,
    required this.watchUserWithUidUseCase,
    required this.updateUserWithUidUseCase,
    required this.changeUsernameUseCase,
    required this.refreshDeckUseCase,
    required this.deleteUserUseCase,
  }) : super(const UserEmpty()) {
    on<ReadWithUidRequested>(onReadWithUidRequested);
    on<WatchWithUidRequested>(onUserWatchRequested);
    on<UpdateRequested>(onUserUpdateRequested);
    on<ChangeUsernameRequested>(onUsernameChangeRequested);
    on<DeleteRequested>(onUserDeleteRequested);
    on<RefreshDeckRequested>(onRefreshDeckRequested);
    on<StopWatchingUserRequested>(onStopWatchingUserRequested);
  }
  final CreateUserUseCase createUserUseCase;
  final ReadUserWithUidUseCase readUserWithUidUseCase;
  final WatchUserWithUidUseCase watchUserWithUidUseCase;
  final UpdateUserWithUidUseCase updateUserWithUidUseCase;
  final ChangeUsernameUseCase changeUsernameUseCase;
  final RefreshDeckUseCase refreshDeckUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  StreamSubscription<Either<Failure, User>>? _userSubscription;

  Future<void> onReadWithUidRequested(
    ReadWithUidRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserInitializing());
    final tryReadUser = await readUserWithUidUseCase.execute(
      UidParams(uid: event.uid),
    );

    tryReadUser.fold(
      (failure) {
        if (failure.message == 'No document found with the specified uid.') {
          emit(UserLoading(user: state.user));
        } else {
          emit(UserEmpty(errorMessage: failure.message));
        }
      },
      (userEntity) {
        emit(UserHasData(user: userEntity));
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

  Future<void> onUserUpdateRequested(
    UpdateRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(UserLoading(user: state.user));
    final tryUpdateUser = await updateUserWithUidUseCase.execute(event.user);
    tryUpdateUser.fold(
      (failure) => emit(
        UserHasData(
          user: oldState.user,
          errorMessage: failure.message,
        ),
      ),
      (userEntity) => emit(UserHasData(user: userEntity)),
    );
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

  Future<void> onUserDeleteRequested(
    DeleteRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(UserLoading(user: state.user));
    final tryTest = await deleteUserUseCase.execute(UidParams(uid: event.uid));
    tryTest.fold(
      (failure) => emit(
        UserHasData(
          user: oldState.user,
          errorMessage: failure.message,
        ),
      ),
      (success) => const UserEmpty(),
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
