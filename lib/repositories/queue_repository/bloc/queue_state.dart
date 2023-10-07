part of 'queue_bloc.dart';

abstract class QueueState extends Equatable {
  const QueueState({
    this.errorMessage,
    this.queue,
  });
  final String? errorMessage;
  final Queue? queue;

  QueueState copyWith({
    Queue? queue,
    String? errorMessage,
  }) {
    return QueueLeaved(
      queue: queue ?? this.queue,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        queue,
      ];
}

class QueueEmpty extends QueueState {
  const QueueEmpty({super.queue, super.errorMessage});
}

class QueueLoading extends QueueState {
  const QueueLoading({super.queue, super.errorMessage});
}

class QueueReadyToEnter extends QueueState {
  const QueueReadyToEnter({super.queue, super.errorMessage});
}

class QueueHasData extends QueueState {
  const QueueHasData({required super.queue, super.errorMessage});
}

class QueueHasError extends QueueState {
  const QueueHasError({required super.errorMessage, super.queue});
}

class QueueLeaved extends QueueState {
  const QueueLeaved({super.queue, super.errorMessage});
}
