import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../user_repository/domain/usecase/params/uid_params.dart';
import '../domain/entities/delete_request.dart';
import '../domain/usecase/params/no_params.dart';
import '../domain/usecase/usecases/cancel_delete_request.dart';
import '../domain/usecase/usecases/check_delete_request.dart';
import '../domain/usecase/usecases/create_delete_request.dart';

part 'delete_request_event.dart';
part 'delete_request_state.dart';

class DeleteRequestBloc extends Bloc<DeleteRequestEvent, DeleteRequestState>
    with ChangeNotifier {
  DeleteRequestBloc({
    required this.cancelDeleteRequestUseCase,
    required this.createDeleteRequestUseCase,
    required this.checkDeleteRequestUseCase,
  }) : super(const DeleteRequestNotChecked()) {
    on<CreateDeleteRequestRequested>(onCreateDeleteRequestRequested);
    on<CancelDeleteRequestRequested>(onCancelDeleteRequestRequested);
    on<CheckDeleteRequestRequested>(onCheckDeleteRequestRequested);
    on<ClearDeleteRequestStateRequested>(onClearDeleteRequestStateRequested);
  }

  final CancelDeleteRequestUseCase cancelDeleteRequestUseCase;
  final CreateDeleteRequestUseCase createDeleteRequestUseCase;
  final CheckDeleteRequestUseCase checkDeleteRequestUseCase;

  Future<void> onCreateDeleteRequestRequested(
    CreateDeleteRequestRequested event,
    Emitter<DeleteRequestState> emit,
  ) async {
    emit(const DeleteRequestLoading());

    final tryCreateDeleteRequest = await createDeleteRequestUseCase.execute(
      const NoParams(),
    );

    tryCreateDeleteRequest.fold(
      (failure) {
        emit(DeleteRequestEmpty(errorMessage: failure.message));
      },
      (deleteRequest) {
        emit(DeleteRequestHasData(deleteRequest: deleteRequest));
      },
    );
  }

  Future<void> onCancelDeleteRequestRequested(
    CancelDeleteRequestRequested event,
    Emitter<DeleteRequestState> emit,
  ) async {
    final oldState = state;
    emit(const DeleteRequestLoading());

    final tryCancelDeleteRequest = await cancelDeleteRequestUseCase.execute(
      const NoParams(),
    );

    tryCancelDeleteRequest.fold(
      (failure) {
        emit(
          DeleteRequestHasData(
            deleteRequest: oldState.deleteRequest,
            errorMessage: failure.message,
          ),
        );
      },
      (deleteRequest) {
        emit(const DeleteRequestEmpty());
      },
    );
  }

  Future<void> onCheckDeleteRequestRequested(
    CheckDeleteRequestRequested event,
    Emitter<DeleteRequestState> emit,
  ) async {
    emit(const DeleteRequestLoading());

    final tryCheckDeleteRequest =
        await checkDeleteRequestUseCase.execute(UidParams(uid: event.uid));
    tryCheckDeleteRequest.fold(
      (failure) {
        if (failure.message == 'No Delete Request Data') {
          emit(
            const DeleteRequestEmpty(),
          );
        } else {
          emit(
            const DeleteRequestNotChecked(),
          );
        }
      },
      (deleteRequest) => emit(
        DeleteRequestHasData(
          deleteRequest: deleteRequest,
        ),
      ),
    );
  }

  void onClearDeleteRequestStateRequested(
    ClearDeleteRequestStateRequested event,
    Emitter<DeleteRequestState> emit,
  ) {
    emit(const DeleteRequestNotChecked());
  }
}
