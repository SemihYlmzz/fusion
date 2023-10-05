import '../../../../core/typedefs/typedefs.dart';
import '../entities/delete_request.dart';

// ignore: one_member_abstracts
abstract class DeleteRequestRepository {
  FutureEither<DeleteRequest> createDeleteRequest();
}
