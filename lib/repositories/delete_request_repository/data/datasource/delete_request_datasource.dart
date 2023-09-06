import '../../../../utils/typedefs.dart';
import '../../domain/entities/delete_request.dart';

abstract class DeleteRequestDatasource {
  FutureEither<DeleteRequest> createDeleteRequest();

  FutureUnit cancelDeleteRequest();
  
  FutureEither<DeleteRequest> checkDeleteRequest({
    required String uid,
  });
}
