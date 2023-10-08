part of 'delete_request_bloc.dart';

sealed class DeleteRequestEvent {
  const DeleteRequestEvent();
}

final class CreateDeleteRequestRequested extends DeleteRequestEvent {
  const CreateDeleteRequestRequested();
}

final class ClearDeleteRequestErrorMessageRequested extends DeleteRequestEvent {
  const ClearDeleteRequestErrorMessageRequested();
}
