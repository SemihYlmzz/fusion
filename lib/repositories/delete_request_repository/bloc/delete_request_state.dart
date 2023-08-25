part of 'delete_request_bloc.dart';

abstract class DeleteRequestState extends Equatable {
  const DeleteRequestState({
    this.errorMessage,
    this.deleteRequest,
  });
  final String? errorMessage;
  final DeleteRequest? deleteRequest;

  @override
  List<Object?> get props => [
        errorMessage,
        deleteRequest,
      ];
}

class DeleteRequestNotChecked extends DeleteRequestState {
  const DeleteRequestNotChecked({super.deleteRequest, super.errorMessage});
}

class DeleteRequestEmpty extends DeleteRequestState {
  const DeleteRequestEmpty({super.deleteRequest, super.errorMessage});
}

class DeleteRequestHasData extends DeleteRequestState {
  const DeleteRequestHasData({
    required super.deleteRequest,
    super.errorMessage,
  });
}

class DeleteRequestLoading extends DeleteRequestState {
  const DeleteRequestLoading({
    super.deleteRequest,
    super.errorMessage,
  });
}
