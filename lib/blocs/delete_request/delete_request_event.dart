part of 'delete_request_bloc.dart';

sealed class DeleteRequestEvent {
  const DeleteRequestEvent({
    this.errorCleanType = ErrorCleanType.afterDisplay,
    this.errorDisplayType = ErrorDisplayType.snackBar,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

final class CreateDeleteRequestRequested extends DeleteRequestEvent {
  const CreateDeleteRequestRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class ClearDeleteRequestErrorMessageRequested extends DeleteRequestEvent {
  const ClearDeleteRequestErrorMessageRequested();
}
