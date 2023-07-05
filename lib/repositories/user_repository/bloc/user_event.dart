part of 'user_bloc.dart';

sealed class UserEvent {
  const UserEvent();
}


final class UserReadWithUidRequested extends UserEvent {
  const UserReadWithUidRequested(this.uid);
  final String uid;
}

final class UserWatchRequested extends UserEvent {
  const UserWatchRequested(this.uid);

  final String uid;
}

final class UserUpdateRequested extends UserEvent {
  const UserUpdateRequested(this.user);

  final User user;
}

final class UserDeleteRequested extends UserEvent {
  const UserDeleteRequested(this.uid);

  final String uid;
}
