import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fusion/repositories/queue/domain/usecase/params/no_params.dart';
import 'package:fusion/repositories/queue/domain/usecase/usecases/check_queue.dart';
import 'package:fusion/repositories/queue/domain/usecase/usecases/enter_queue.dart';
import 'package:fusion/repositories/queue/domain/usecase/usecases/leave_queue.dart';

import '../../repositories/queue/domain/entities/queue.dart';


part 'queue_event.dart';
part 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> with ChangeNotifier {
  QueueBloc({
    required EnterQueueUseCase enterQueueUseCase,
    required LeaveQueueUseCase leaveQueueUseCase,
    required CheckQueueUseCase checkQueueUseCase,
  })  : _checkQueueUseCase = checkQueueUseCase,
        _leaveQueueUseCase = leaveQueueUseCase,
        _enterQueueUseCase = enterQueueUseCase,
        super(const QueueEmpty()) {
    on<EnterQueueRequested>(_onEnterQueueRequested);
    on<LeaveQueueRequested>(_onLeaveQueueRequested);
    on<CheckQueueRequested>(_onCheckQueueRequested);
    on<ClearQueueErrorMessageRequested>(_onClearQueueErrorMessageRequested);
  }
  final EnterQueueUseCase _enterQueueUseCase;
  final LeaveQueueUseCase _leaveQueueUseCase;
  final CheckQueueUseCase _checkQueueUseCase;

  Future<void> _onEnterQueueRequested(
    EnterQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(const QueueLoading());

    final tryEnterQueue = await _enterQueueUseCase.execute(
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

  Future<void> _onLeaveQueueRequested(
    LeaveQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(QueueLoading(queue: state.queue));

    final tryLeaveQueue = await _leaveQueueUseCase.execute(
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

  Future<void> _onCheckQueueRequested(
    CheckQueueRequested event,
    Emitter<QueueState> emit,
  ) async {
    emit(const QueueLoading());

    final tryCheckQueue = await _checkQueueUseCase.execute(
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
