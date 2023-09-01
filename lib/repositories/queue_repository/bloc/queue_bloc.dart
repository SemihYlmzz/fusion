import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fusion/repositories/queue_repository/domain/usecase/usecases/enter_queue.dart';
import 'package:fusion/repositories/queue_repository/domain/usecase/usecases/leave_queue.dart';

import '../domain/entities/queue.dart';
import '../domain/usecase/params/no_params.dart';

part 'queue_event.dart';
part 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> with ChangeNotifier {
  QueueBloc({
    required this.enterQueueUseCase,
    required this.leaveQueueUseCase,
  }) : super(const QueueEmpty()) {
    on<EnterQueueRequested>(onEnterQueueRequested);
    on<LeaveQueueRequested>(onLeaveQueueRequested);
  }
  final EnterQueueUseCase enterQueueUseCase;
  final LeaveQueueUseCase leaveQueueUseCase;

  Future<void> onEnterQueueRequested(
    EnterQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(const EnteringQueue());

    final tryEnterQueue = await enterQueueUseCase.execute(
      const NoParams(),
    );

    tryEnterQueue.fold(
      (failure) => emit(
        QueueEmpty(
          errorMessage: failure.message,
        ),
      ),
      (queueEntity) => emit(QueueHasData(queue: queueEntity)),
    );
  }

  Future<void> onLeaveQueueRequested(
    LeaveQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(LeavingQueue(queue: state.queue));

    final tryLeaveQueue = await leaveQueueUseCase.execute(
      const NoParams(),
    );

    tryLeaveQueue.fold(
      (failure) => emit(
        QueueHasData(
          queue: state.queue,
          errorMessage: failure.message,
        ),
      ),
      (success) => const QueueEmpty(),
    );
  }
}
