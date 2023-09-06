import 'package:fpdart/fpdart.dart';

import '../../../../../utils/failure.dart';
import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../entities/queue.dart';
import '../../repository/queue_repository.dart';
import '../params/no_params.dart';

class EnterQueueUseCase extends UseCase<Either<Failure, Queue>, NoParams> {
  EnterQueueUseCase({required this.queueRepository});
  final QueueRepository queueRepository;

  @override
  FutureEither<Queue> execute(NoParams params) async {
    return queueRepository.enterQueue();
  }
}
