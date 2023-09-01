import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/queue_repository/domain/entities/queue.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../repository/queue_repository.dart';
import '../params/no_params.dart';

class CheckQueueUseCase extends UseCase<Either<Failure, Queue>, NoParams> {
  CheckQueueUseCase({required this.queueRepository});
  final QueueRepository queueRepository;

  @override
  FutureEither<Queue> execute(NoParams params) async {
    return queueRepository.checkQueue();
  }
}
