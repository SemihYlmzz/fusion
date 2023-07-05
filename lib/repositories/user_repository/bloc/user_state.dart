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

class UserEmpty extends UserState {
  const UserEmpty({super.user, super.errorMessage});
}

class UserLoading extends UserState {
  const UserLoading({super.user, super.errorMessage});
}

class UserHasData extends UserState {
  const UserHasData({required super.user, super.errorMessage});
}
