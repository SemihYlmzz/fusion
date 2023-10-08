part of 'user_bloc.dart';

sealed class UserEvent {
  const UserEvent();
}

final class ReadWithUidRequested extends UserEvent {
  const ReadWithUidRequested(this.uid);
  final String uid;
}

final class WatchWithUidRequested extends UserEvent {
  const WatchWithUidRequested();
}

final class UpdateRequested extends UserEvent {
  const UpdateRequested(this.userModel);

  final UserModel userModel;
}

final class ChangeUsernameRequested extends UserEvent {
  const ChangeUsernameRequested(this.newUsername);
  final String newUsername;
}

final class RefreshDeckRequested extends UserEvent {
  const RefreshDeckRequested();
}

final class DeleteRequested extends UserEvent {
  const DeleteRequested(this.uid);

  final String uid;
}

final class StopWatchingUserRequested extends UserEvent {
  const StopWatchingUserRequested();
}

final class ClearUserErrorMessageRequested extends UserEvent {
  const ClearUserErrorMessageRequested();
}
