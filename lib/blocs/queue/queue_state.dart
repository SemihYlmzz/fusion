part of 'queue_bloc.dart';

abstract class QueueState extends Equatable {
  const QueueState({
    this.errorMessage,
    this.queue,
  });
  final String? errorMessage;
  final QueueModel? queue;

  QueueState copyWith({
    String? errorMessage,
    QueueModel? queue,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        queue,
      ];
}

class QueueEmpty extends QueueState {
  const QueueEmpty();

  @override
  QueueState copyWith({
    String? errorMessage,
    QueueModel? queue,
  }) {
    return const QueueEmpty();
  }
}

class QueueLoading extends QueueState {
  const QueueLoading({super.queue});
  @override
  QueueState copyWith({
    String? errorMessage,
    QueueModel? queue,
  }) {
    return QueueLoading(queue: queue ?? this.queue);
  }
}

class QueueReadyToEnter extends QueueState {
  const QueueReadyToEnter({super.queue});
  @override
  QueueState copyWith({
    String? errorMessage,
    QueueModel? queue,
  }) {
    return QueueReadyToEnter(queue: queue ?? this.queue);
  }
}

class QueueHasData extends QueueState {
  const QueueHasData({required super.queue});
  @override
  QueueState copyWith({
    String? errorMessage,
    QueueModel? queue,
  }) {
    return QueueHasData(queue: queue ?? this.queue);
  }
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
  @override
  QueueState copyWith({
    String? errorMessage,
    QueueModel? queue,
    ErrorCleanType? errorCleanType,
    ErrorDisplayType? errorDisplayType,
  }) {
    return QueueHasError(
      queue: queue ?? this.queue,
      errorMessage: errorMessage ?? this.errorMessage,
      errorCleanType: errorCleanType ?? this.errorCleanType,
      errorDisplayType: errorDisplayType ?? this.errorDisplayType,
    );
  }
}

class QueueLeaved extends QueueState {
  const QueueLeaved();
  @override
  QueueState copyWith({
    String? errorMessage,
    QueueModel? queue,
  }) {
    return const QueueLeaved();
  }
}
