import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/queue.dart';
import '../domain/usecase/params/no_params.dart';
import '../domain/usecase/usecases/check_queue.dart';
import '../domain/usecase/usecases/enter_queue.dart';
import '../domain/usecase/usecases/leave_queue.dart';

part 'queue_event.dart';
part 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> with ChangeNotifier {
  QueueBloc({
    required this.enterQueueUseCase,
    required this.leaveQueueUseCase,
    required this.checkQueueUseCase,
  }) : super(const QueueEmpty()) {
    on<EnterQueueRequested>(onEnterQueueRequested);
    on<LeaveQueueRequested>(onLeaveQueueRequested);
    on<CheckQueueRequested>(onCheckQueueRequested);
    on<CalibrateQueueStateRequested>(onCalibrateQueueStateRequested);
  }
  final EnterQueueUseCase enterQueueUseCase;
  final LeaveQueueUseCase leaveQueueUseCase;
  final CheckQueueUseCase checkQueueUseCase;

  Future<void> onEnterQueueRequested(
    EnterQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(const QueueLoading());

    final tryEnterQueue = await enterQueueUseCase.execute(
      const NoParams(),
    );

    tryEnterQueue.fold(
      (failure) async {
        emit(
          QueueHasError(errorMessage: failure.message, queue: state.queue),
        );
      },
      (queueEntity) => emit(QueueHasData(queue: queueEntity)),
    );
  }

  Future<void> onLeaveQueueRequested(
    LeaveQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(QueueLoading(queue: state.queue));

    final tryLeaveQueue = await leaveQueueUseCase.execute(
      const NoParams(),
    );

    tryLeaveQueue.fold(
      (failure) {
        if (failure.message == 'Not in queue.') {
          const QueueLeaved();
        } else {
          emit(
            QueueHasError(errorMessage: failure.message, queue: state.queue),
          );
        }
      },
      (success) => emit(const QueueLeaved()),
    );
  }

  Future<void> onCheckQueueRequested(
    CheckQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(const QueueLoading());

    final tryCheckQueue = await checkQueueUseCase.execute(
      const NoParams(),
    );

    tryCheckQueue.fold(
      (failure) {
        emit(
          QueueHasError(errorMessage: failure.message, queue: state.queue),
        );
      },
      (queue) => queue == null
          ? emit(const QueueReadyToEnter())
          : emit(QueueHasData(queue: queue)),
    );
  }

  Future<void> onCalibrateQueueStateRequested(
    CalibrateQueueStateRequested event,
    Emitter<QueueState> emit,
  ) async {
    if (state.queue != null) {
      emit(QueueHasData(queue: state.queue));
    } else {
      emit(const QueueEmpty());
    }
  }
}
