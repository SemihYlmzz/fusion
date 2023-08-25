import 'package:fusion/repositories/delete_request_repository/domain/entities/delete_request.dart';
import 'package:fusion/utils/typedefs.dart';

abstract class DeleteRequestRepository {
  FutureEither<DeleteRequest> createDeleteRequest();

  FutureUnit cancelDeleteRequest();

  FutureEither<DeleteRequest> checkDeleteRequest({
    required String uid,
  });
}
