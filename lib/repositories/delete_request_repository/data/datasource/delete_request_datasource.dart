import '../models/delete_model.dart';

abstract class DeleteRequestDatasource {
  Future<DeleteRequestModel> createDeleteRequest();

  Future<void> cancelDeleteRequest();
  
  Future<DeleteRequestModel?> checkDeleteRequest({
    required String uid,
  });
}
