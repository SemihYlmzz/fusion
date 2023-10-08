import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fusion/repositories/delete/domain/usecase/params/no_params.dart';

import '../../repositories/delete/domain/entities/delete_request.dart';
import '../../repositories/delete/domain/usecase/usecases/create_delete_request.dart';


part 'delete_request_event.dart';
part 'delete_request_state.dart';

class DeleteRequestBloc extends Bloc<DeleteRequestEvent, DeleteRequestState>
    with ChangeNotifier {
  DeleteRequestBloc({
    required CreateDeleteRequestUseCase createDeleteRequestUseCase,
  })  : _createDeleteRequestUseCase = createDeleteRequestUseCase,
        super(const DeleteRequestEmpty()) {
    on<CreateDeleteRequestRequested>(_onCreateDeleteRequestRequested);
    on<ClearDeleteRequestErrorMessageRequested>(
      _onClearDeleteRequestErrorMessageRequested,
    );
  }

  final CreateDeleteRequestUseCase _createDeleteRequestUseCase;

  Future<void> _onCreateDeleteRequestRequested(
    CreateDeleteRequestRequested event,
    Emitter<DeleteRequestState> emit,
  ) async {
    emit(const DeleteRequestLoading());

    final tryCreateDeleteRequest = await _createDeleteRequestUseCase.execute(
      const NoParams(),
    );

    tryCreateDeleteRequest.fold(
      (failure) {
        emit(DeleteRequestHasError(errorMessage: failure.message));
      },
      (deleteRequest) {
        emit(DeleteRequestHasData(deleteRequest: deleteRequest));
      },
    );
  }

  Future<void> _onClearDeleteRequestErrorMessageRequested(
    ClearDeleteRequestErrorMessageRequested event,
    Emitter<DeleteRequestState> emit,
  ) async {
    if (state.deleteRequest != null) {
      emit(DeleteRequestHasData(deleteRequest: state.deleteRequest));
    } else {
      emit(const DeleteRequestEmpty());
    }
  }
}
