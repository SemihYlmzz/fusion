part of 'queue_bloc.dart';

sealed class QueueEvent {
  const QueueEvent({
    this.errorCleanType = ErrorCleanType.afterDisplay,
    this.errorDisplayType = ErrorDisplayType.snackBar,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

final class EnterQueueRequested extends QueueEvent {
  const EnterQueueRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class LeaveQueueRequested extends QueueEvent {
  const LeaveQueueRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class CheckQueueRequested extends QueueEvent {
  const CheckQueueRequested({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class ClearQueueErrorMessageRequested extends QueueEvent {
  const ClearQueueErrorMessageRequested();
}
