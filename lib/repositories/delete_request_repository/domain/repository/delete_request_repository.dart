import '../../../../utils/typedefs.dart';
import '../entities/delete_request.dart';

abstract class DeleteRequestRepository {
  FutureEither<DeleteRequest> createDeleteRequest();

  FutureUnit cancelDeleteRequest();

  FutureEither<DeleteRequest> checkDeleteRequest({
    required String uid,
  });
}
