import '../../../../utils/typedefs.dart';
import '../../domain/entities/queue.dart';

abstract class QueueDatasource {
  FutureEither<Queue> enterQueue();

  FutureUnit leaveQueue();

  FutureEither<Queue> checkQueue();
}
