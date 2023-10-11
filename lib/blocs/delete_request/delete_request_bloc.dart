import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../repositories/repositories.dart';

part 'delete_request_event.dart';
part 'delete_request_state.dart';

class DeleteRequestBloc extends Bloc<DeleteRequestEvent, DeleteRequestState>
    with ChangeNotifier {
  DeleteRequestBloc({
    required DeleteRequestRepository deleteRequestRepository,
  })  : _deleteRequestRepository = deleteRequestRepository,
        super(const DeleteRequestEmpty()) {
    on<CreateDeleteRequestRequested>(_onCreateDeleteRequestRequested);
    on<ClearDeleteRequestErrorMessageRequested>(
      _onClearDeleteRequestErrorMessageRequested,
    );
  }

  final DeleteRequestRepository _deleteRequestRepository;

  Future<void> _onCreateDeleteRequestRequested(
    CreateDeleteRequestRequested event,
    Emitter<DeleteRequestState> emit,
  ) async {
    emit(const DeleteRequestLoading());

    final tryCreateDeleteRequest =
        await _deleteRequestRepository.createDeleteRequest();

    tryCreateDeleteRequest.fold(
      (failure) {
        emit(
          DeleteRequestHasError(
            errorDisplayType: event.errorDisplayType,
            errorMessage: failure.message,
            errorCleanType: event.errorCleanType,
          ),
        );
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
