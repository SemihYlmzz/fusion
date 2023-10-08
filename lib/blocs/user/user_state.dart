part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState({
    this.errorMessage,
    this.user,
  });
  final String? errorMessage;
  final User? user;

  @override
  List<Object?> get props => [
        errorMessage,
        user,
      ];
}

class UserInitializing extends UserState {
  const UserInitializing();
}

class UserLoading extends UserState {
  const UserLoading({required super.user});
}

class UserHasError extends UserState {
  const UserHasError({required super.errorMessage, super.user});
}

class UserHasData extends UserState {
  const UserHasData({required super.user});
}

class UserEmpty extends UserState {
  const UserEmpty();
}
