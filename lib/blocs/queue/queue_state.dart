part of 'queue_bloc.dart';

abstract class QueueState extends Equatable {
  const QueueState({
    this.errorMessage,
    this.queue,
  });
  final String? errorMessage;
  final QueueModel? queue;

  @override
  List<Object?> get props => [
        errorMessage,
        queue,
      ];
}

class QueueEmpty extends QueueState {
  const QueueEmpty();
}

class QueueLoading extends QueueState {
  const QueueLoading({super.queue});
}

class QueueReadyToEnter extends QueueState {
  const QueueReadyToEnter({super.queue});
}

class QueueHasData extends QueueState {
  const QueueHasData({required super.queue});
}

class QueueHasError extends QueueState {
  const QueueHasError({
    required super.errorMessage,
    required this.errorCleanType,
    required this.errorDisplayType,
    super.queue,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

class QueueLeaved extends QueueState {
  const QueueLeaved();
}
