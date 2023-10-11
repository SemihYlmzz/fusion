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

class UserLoading extends UserState {
  const UserLoading({super.userModel});
}

class UserHasError extends UserState {
  const UserHasError({
    required super.errorMessage,
    required this.errorCleanType,
    required this.errorDisplayType,
    super.userModel,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

class UserHasData extends UserState {
  const UserHasData({required super.userModel});
}

class UserEmpty extends UserState {
  const UserEmpty();
}
