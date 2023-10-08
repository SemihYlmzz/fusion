import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fusion/repositories/repositories.dart';



part 'queue_event.dart';
part 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> with ChangeNotifier {
  QueueBloc({
    required QueueRepository queueRepository,
  })  : _queueRepository = queueRepository,
        super(const QueueEmpty()) {
    on<EnterQueueRequested>(_onEnterQueueRequested);
    on<LeaveQueueRequested>(_onLeaveQueueRequested);
    on<CheckQueueRequested>(_onCheckQueueRequested);
    on<ClearQueueErrorMessageRequested>(_onClearQueueErrorMessageRequested);
  }
  final QueueRepository _queueRepository;

  Future<void> _onEnterQueueRequested(
    EnterQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(const QueueLoading());

    final tryEnterQueue = await _queueRepository.enterQueue();

    tryEnterQueue.fold(
      (failure) async {
        emit(
          QueueHasError(errorMessage: failure.message, queue: state.queue),
        );
      },
      (queueEntity) => emit(QueueHasData(queue: queueEntity)),
    );
  }

  Future<void> _onLeaveQueueRequested(
    LeaveQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(QueueLoading(queue: state.queue));

    final tryLeaveQueue = await _queueRepository.leaveQueue();

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

  Future<void> _onCheckQueueRequested(
    CheckQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(const QueueLoading());

    final tryCheckQueue = await _queueRepository.checkQueue();

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

  Future<void> _onClearQueueErrorMessageRequested(
    ClearQueueErrorMessageRequested event,
    Emitter<QueueState> emit,
  ) async {
    if (state.queue != null) {
      emit(QueueHasData(queue: state.queue));
    } else {
      emit(const QueueEmpty());
    }
  }
}
