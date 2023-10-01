import 'package:fusion/repositories/queue_repository/data/models/queue_model.dart';


abstract class QueueDatasource {
  Future<QueueModel> enterQueue();

  Future<void> leaveQueue();

  Future<QueueModel?> checkQueue();
}
