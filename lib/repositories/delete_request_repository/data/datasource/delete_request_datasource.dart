import 'package:fusion/repositories/delete_request_repository/domain/entities/delete_request.dart';

import '../../../../utils/typedefs.dart';

abstract class DeleteRequestDatasource {
  FutureEither<DeleteRequest> createDeleteRequest();

  FutureUnit cancelDeleteRequest();
  
  FutureEither<DeleteRequest> checkDeleteRequest({
    required String uid,
  });
}
