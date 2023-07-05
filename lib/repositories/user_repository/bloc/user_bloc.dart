import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../utils/failure.dart';
import '../domain/entities/user.dart';
import '../domain/usecase/params/uid_params.dart';
import '../domain/usecase/usecases/create_user.dart';
import '../domain/usecase/usecases/delete_user.dart';
import '../domain/usecase/usecases/read_user_with_uid.dart';
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
    required this.deleteUserUseCase,
  }) : super(const UserEmpty()) {
    on<UserReadWithUidRequested>(onUserReadWithUidRequested);
    on<UserWatchRequested>(onUserWatchRequested);
    on<UserUpdateRequested>(onUserUpdateRequested);
    on<UserDeleteRequested>(onUserDeleteRequested);
  }
  final CreateUserUseCase createUserUseCase;
  final ReadUserWithUidUseCase readUserWithUidUseCase;
  final WatchUserWithUidUseCase watchUserWithUidUseCase;
  final UpdateUserWithUidUseCase updateUserWithUidUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  StreamSubscription<Either<Failure, User>>? _userSubscription;

  Future<void> onUserReadWithUidRequested(
    UserReadWithUidRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    final tryReadUser =
        await readUserWithUidUseCase.execute(UidParams(uid: event.uid));

    tryReadUser.fold(
      (failure) {
        if (failure.message == 'No document found with the specified uid.') {
          emit(const UserLoading());
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
    UserWatchRequested event,
    Emitter<UserState> emit,
  ) async {
    if (_userSubscription != null) {
      return;
    }

    emit(const UserLoading());

    _userSubscription = watchUserWithUidUseCase
        .execute(UidParams(uid: event.uid))
        .listen((event) {
      event.fold(
        (failure) {
          emit(
            UserHasData(
              user: state.user,
              errorMessage: failure.message,
            ),
          );
        },
        (userEntity) {
          emit(UserHasData(user: userEntity));
        },
      );
    });
  }

  Future<void> onUserUpdateRequested(
    UserUpdateRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(const UserLoading());
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

  Future<void> onUserDeleteRequested(
    UserDeleteRequested event,
    Emitter<UserState> emit,
  ) async {
    final oldState = state;
    emit(const UserLoading());
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

  @override
  Future<void> close() {
    _userSubscription = null;
    return super.close();
  }
}
