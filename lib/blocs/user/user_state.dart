part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState({
    this.errorMessage,
    this.userModel,
  });
  final String? errorMessage;
  final UserModel? userModel;

  UserState copyWith({
    String? errorMessage,
    UserModel? userModel,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        userModel,
      ];
}

class UserLoading extends UserState {
  const UserLoading({super.userModel});

  @override
  UserState copyWith({String? errorMessage, UserModel? userModel}) {
    return UserLoading(userModel: userModel ?? this.userModel);
  }
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

  @override
  UserState copyWith({
    String? errorMessage,
    UserModel? userModel,
    ErrorCleanType? errorCleanType,
    ErrorDisplayType? errorDisplayType,
  }) {
    return UserHasError(
      errorMessage: errorMessage ?? this.errorMessage,
      userModel: userModel ?? this.userModel,
      errorCleanType: errorCleanType ?? this.errorCleanType,
      errorDisplayType: errorDisplayType ?? this.errorDisplayType,
    );
  }
}

class UserHasData extends UserState {
  const UserHasData({required super.userModel});
  @override
  UserState copyWith({
    String? errorMessage,
    UserModel? userModel,
  }) {
    return UserHasData(
      userModel: userModel ?? this.userModel,
    );
  }
}

class UserEmpty extends UserState {
  const UserEmpty();
  @override
  UserState copyWith({
    String? errorMessage,
    UserModel? userModel,
  }) {
    return const UserEmpty();
  }
}
