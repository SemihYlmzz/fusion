import '../../../../core/typedefs/typedefs.dart';
import '../entities/queue.dart';

abstract class QueueRepository {
  FutureEither<Queue> enterQueue();

  FutureEither<Queue> checkQueue();

  FutureUnit leaveQueue();
}
