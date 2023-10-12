part of 'user_bloc.dart';

sealed class UserEvent {
  const UserEvent({
    this.errorCleanType = ErrorCleanType.immediately,
    this.errorDisplayType = ErrorDisplayType.snackBar,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

final class ReadWithUidRequested extends UserEvent {
  const ReadWithUidRequested({
    required this.uid,
    super.errorCleanType,
    super.errorDisplayType,
  });
  final String uid;
}

final class WatchWithUidRequested extends UserEvent {
  const WatchWithUidRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class UpdateRequested extends UserEvent {
  const UpdateRequested({
    required this.userModel,
    super.errorCleanType,
    super.errorDisplayType,
  });

  final UserModel userModel;
}

final class ChangeUsernameRequested extends UserEvent {
  const ChangeUsernameRequested({
    required this.newUsername,
    super.errorCleanType,
    super.errorDisplayType,
  });
  final String newUsername;
}

final class RefreshDeckRequested extends UserEvent {
  const RefreshDeckRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class DeleteRequested extends UserEvent {
  const DeleteRequested({
    required this.uid,
    super.errorCleanType,
    super.errorDisplayType,
  });

  final String uid;
}

final class StopWatchingUserRequested extends UserEvent {
  const StopWatchingUserRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class ClearUserErrorMessageRequested extends UserEvent {
  const ClearUserErrorMessageRequested();
}

final class ClearUserRequested extends UserEvent {
  const ClearUserRequested();
}
