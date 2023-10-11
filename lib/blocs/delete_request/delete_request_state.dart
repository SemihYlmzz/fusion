part of 'delete_request_bloc.dart';

abstract class DeleteRequestState extends Equatable {
  const DeleteRequestState({
    this.errorMessage,
    this.deleteRequest,
  });
  final String? errorMessage;
  final DeleteRequestModel? deleteRequest;

  DeleteRequestState copyWith({
    String? errorMessage,
    DeleteRequestModel? deleteRequest,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        deleteRequest,
      ];
}

class DeleteRequestEmpty extends DeleteRequestState {
  const DeleteRequestEmpty();

  @override
  DeleteRequestState copyWith({
    String? errorMessage,
    DeleteRequestModel? deleteRequest,
  }) {
    return const DeleteRequestEmpty();
  }
}

class DeleteRequestHasData extends DeleteRequestState {
  const DeleteRequestHasData({required super.deleteRequest});

  @override
  DeleteRequestState copyWith({
    String? errorMessage,
    DeleteRequestModel? deleteRequest,
  }) {
    return DeleteRequestHasData(
      deleteRequest: deleteRequest ?? this.deleteRequest,
    );
  }
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
  @override
  DeleteRequestState copyWith({
    String? errorMessage,
    DeleteRequestModel? deleteRequest,
    ErrorCleanType? errorCleanType,
    ErrorDisplayType? errorDisplayType,
  }) {
    return DeleteRequestHasError(
      deleteRequest: deleteRequest ?? this.deleteRequest,
      errorMessage: errorMessage ?? this.errorMessage,
      errorCleanType: errorCleanType ?? this.errorCleanType,
      errorDisplayType: errorDisplayType ?? this.errorDisplayType,
    );
  }
}

class DeleteRequestLoading extends DeleteRequestState {
  const DeleteRequestLoading({super.deleteRequest});
  @override
  DeleteRequestState copyWith({
    String? errorMessage,
    DeleteRequestModel? deleteRequest,
  }) {
    return DeleteRequestLoading(
      deleteRequest: deleteRequest ?? this.deleteRequest,
    );
  }
}
