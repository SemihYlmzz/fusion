part of 'delete_request_bloc.dart';

abstract class DeleteRequestState extends Equatable {
  const DeleteRequestState({
    this.errorMessage,
    this.deleteRequest,
  });
  final String? errorMessage;
  final DeleteRequestModel? deleteRequest;

  @override
  List<Object?> get props => [
        errorMessage,
        deleteRequest,
      ];
}

class DeleteRequestEmpty extends DeleteRequestState {
  const DeleteRequestEmpty();
}

class DeleteRequestHasData extends DeleteRequestState {
  const DeleteRequestHasData({required super.deleteRequest});
}

class DeleteRequestHasError extends DeleteRequestState {
  const DeleteRequestHasError({
    required super.errorMessage,
    required this.errorCleanType,
    required this.errorDisplayType,
    super.deleteRequest,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

class DeleteRequestLoading extends DeleteRequestState {
  const DeleteRequestLoading({super.deleteRequest});
}
