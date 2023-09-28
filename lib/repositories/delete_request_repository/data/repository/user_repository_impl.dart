import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/delete_request.dart';
import '../../domain/repository/delete_request_repository.dart';
import '../datasource/delete_request_datasource.dart';

class DeleteRequestRepositoryImpl implements DeleteRequestRepository {
  DeleteRequestRepositoryImpl(
    DeleteRequestDatasource deleteRequestDatasource,
  ) : _deleteRequestDatasource = deleteRequestDatasource;
  final DeleteRequestDatasource _deleteRequestDatasource;

  @override
  FutureEither<DeleteRequest> createDeleteRequest() async {
    return _deleteRequestDatasource.createDeleteRequest();
  }

  @override
  FutureUnit cancelDeleteRequest() async {
    return _deleteRequestDatasource.cancelDeleteRequest();
  }

  @override
  FutureEither<DeleteRequest> checkDeleteRequest({required String uid}) async {
    return _deleteRequestDatasource.checkDeleteRequest(uid: uid);
  }
}
