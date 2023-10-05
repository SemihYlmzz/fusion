import '../models/delete_model.dart';

// ignore: one_member_abstracts
abstract class DeleteRequestDatasource {
  Future<DeleteRequestModel> createDeleteRequest();
}
