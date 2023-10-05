import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/delete_request.dart';
import '../domain/usecase/params/no_params.dart';
import '../domain/usecase/usecases/create_delete_request.dart';

part 'delete_request_event.dart';
part 'delete_request_state.dart';

class DeleteRequestBloc extends Bloc<DeleteRequestEvent, DeleteRequestState>
    with ChangeNotifier {
  DeleteRequestBloc({
    required this.createDeleteRequestUseCase,
  }) : super(const DeleteRequestEmpty()) {
    on<CreateDeleteRequestRequested>(onCreateDeleteRequestRequested);
  }

  final CreateDeleteRequestUseCase createDeleteRequestUseCase;

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
}
