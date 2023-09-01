import 'package:fusion/utils/typedefs.dart';

import '../entities/queue.dart';

abstract class QueueRepository {
  FutureEither<Queue> enterQueue();

  FutureUnit leaveQueue();
}
