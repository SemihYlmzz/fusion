part of 'queue_bloc.dart';

sealed class QueueEvent {
  const QueueEvent();
}

final class EnterQueueRequested extends QueueEvent {
  const EnterQueueRequested();
}

final class LeaveQueueRequested extends QueueEvent {
  const LeaveQueueRequested();
}

final class CheckQueueRequested extends QueueEvent {
  const CheckQueueRequested();
}

final class ClearQueueErrorMessageRequested extends QueueEvent {
  const ClearQueueErrorMessageRequested();
}
