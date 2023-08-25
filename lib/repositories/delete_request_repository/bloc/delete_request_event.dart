part of 'delete_request_bloc.dart';

sealed class DeleteRequestEvent {
  const DeleteRequestEvent();
}

final class CheckDeleteRequestRequested extends DeleteRequestEvent {
  const CheckDeleteRequestRequested(this.uid);
  final String uid;
}

final class CreateDeleteRequestRequested extends DeleteRequestEvent {
  const CreateDeleteRequestRequested();
}

final class CancelDeleteRequestRequested extends DeleteRequestEvent {
  const CancelDeleteRequestRequested();
}

final class ClearDeleteRequestStateRequested extends DeleteRequestEvent {
  const ClearDeleteRequestStateRequested();
}
