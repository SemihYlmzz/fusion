import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failure/failure.dart';
import 'package:fusion/repositories/user/domain/usecase/usecases/change_username.dart';
import 'package:fusion/repositories/user/domain/usecase/usecases/read_user_with_uid.dart';
import 'package:fusion/repositories/user/domain/usecase/usecases/refresh_deck.dart';
import 'package:fusion/repositories/user/domain/usecase/usecases/watch_user_with_uid.dart';

import '../../repositories/user/domain/entities/user.dart';
import '../../repositories/user/domain/usecase/params/no_params.dart';
import '../../repositories/user/domain/usecase/params/uid_params.dart';
import '../../repositories/user/domain/usecase/params/user_name_params.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with ChangeNotifier {
  UserBloc({
    required ReadUserWithUidUseCase readUserWithUidUseCase,
    required WatchUserWithUidUseCase watchUserWithUidUseCase,
    required ChangeUsernameUseCase changeUsernameUseCase,
    required RefreshDeckUseCase refreshDeckUseCase,
  })  : _refreshDeckUseCase = refreshDeckUseCase,
        _changeUsernameUseCase = changeUsernameUseCase,
        _watchUserWithUidUseCase = watchUserWithUidUseCase,
        _readUserWithUidUseCase = readUserWithUidUseCase,
        super(const UserEmpty()) {
    on<ReadWithUidRequested>(_onReadWithUidRequested);
    on<WatchWithUidRequested>(_onUserWatchRequested);
    on<ChangeUsernameRequested>(_onUsernameChangeRequested);
    on<RefreshDeckRequested>(_onRefreshDeckRequested);
    on<StopWatchingUserRequested>(_onStopWatchingUserRequested);
    on<ClearUserErrorMessageRequested>(_onClearUserErrorMessageRequested);
  }
  final ReadUserWithUidUseCase _readUserWithUidUseCase;
  final WatchUserWithUidUseCase _watchUserWithUidUseCase;
  final ChangeUsernameUseCase _changeUsernameUseCase;
  final RefreshDeckUseCase _refreshDeckUseCase;

  StreamSubscription<Either<Failure, User>>? _userSubscription;

  Future<void> _onReadWithUidRequested(
    ReadWithUidRequested event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserHasData) {
      return;
    }
    emit(const UserInitializing());
    final tryReadUser = await _readUserWithUidUseCase.execute(
      UidParams(uid: event.uid),
    );

    tryReadUser.fold(
      (failure) {
        emit(UserHasError(errorMessage: failure.message));
      },
      (userEntity) {
        userEntity != null
            ? emit(UserHasData(user: userEntity))
            : emit(const UserEmpty());
      },
    );
  }

  Future<void> _onUserWatchRequested(
    WatchWithUidRequested event,
    Emitter<UserState> emit,
  ) async {
    await _userSubscription?.cancel();
    emit(UserLoading(user: state.user));

    _userSubscription =
        _watchUserWithUidUseCase.execute(NoParams()).listen((event) {
      event.fold(
        (failure) {
        emit(UserHasError(errorMessage: failure.message,user: state.user));
        },
        (user) {
          emit(UserHasData(user: user));
        },
      );
    });

    await _userSubscription?.asFuture<void>();
  }

  Future<void> _onUsernameChangeRequested(
    ChangeUsernameRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(UserLoading(user: state.user));
    final tryUpdateUser = await _changeUsernameUseCase.execute(
      UsernameParams(username: event.newUsername),
    );
    tryUpdateUser.fold(
      (failure) => emit(
        UserHasError(
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

  Future<void> _onRefreshDeckRequested(
    RefreshDeckRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(UserLoading(user: state.user));
    final tryUpdateUser = await _refreshDeckUseCase.execute(NoParams());
    tryUpdateUser.fold(
      (failure) => emit(
        UserHasError(
          user: oldState.user,
          errorMessage: failure.message,
        ),
      ),
      (userEntity) => add(ReadWithUidRequested(oldState.user!.uid)),
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
    if (state.user == null) {
      emit(const UserEmpty());
    } else {
      emit(UserHasData(user: state.user));
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _userSubscription = null;
    return super.close();
  }
}
