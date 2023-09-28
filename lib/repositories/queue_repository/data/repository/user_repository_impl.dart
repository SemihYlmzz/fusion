import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/queue.dart';
import '../../domain/repository/queue_repository.dart';
import '../datasource/queue_datasource.dart';

class QueueRepositoryImpl implements QueueRepository {
  QueueRepositoryImpl(
    QueueDatasource userDatasource,
  ) : _userDatasource = userDatasource;
  final QueueDatasource _userDatasource;

  @override
  FutureEither<Queue> enterQueue() async {
    return _userDatasource.enterQueue();
  }

  @override
  FutureUnit leaveQueue() {
    return _userDatasource.leaveQueue();
  }

  @override
  FutureEither<Queue> checkQueue() async {
    return _userDatasource.checkQueue();
  }
}
