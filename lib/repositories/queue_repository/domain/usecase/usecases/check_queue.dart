import 'package:fpdart/fpdart.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/queue.dart';
import '../../repository/queue_repository.dart';
import '../params/no_params.dart';

class CheckQueueUseCase extends UseCase<Either<Failure, Queue?>, NoParams> {
  CheckQueueUseCase({required this.queueRepository});
  final QueueRepository queueRepository;

  @override
  FutureEither<Queue?> execute(NoParams params) async {
    return queueRepository.checkQueue();
  }
}
