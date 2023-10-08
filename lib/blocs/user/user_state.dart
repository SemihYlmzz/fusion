part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState({
    this.errorMessage,
    this.userModel,
  });
  final String? errorMessage;
  final UserModel? userModel;

  @override
  List<Object?> get props => [
        errorMessage,
        userModel,
      ];
}

class UserInitializing extends UserState {
  const UserInitializing();
}

class UserLoading extends UserState {
  const UserLoading({required super.userModel});
}

class UserHasError extends UserState {
  const UserHasError({required super.errorMessage, super.userModel});
}

class UserHasData extends UserState {
  const UserHasData({required super.userModel});
}

class UserEmpty extends UserState {
  const UserEmpty();
}
