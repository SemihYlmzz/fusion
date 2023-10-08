import 'package:fpdart/fpdart.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../repository/queue_repository.dart';
import '../params/no_params.dart';

class LeaveQueueUseCase extends UseCase<Either<Failure, void>, NoParams> {
  LeaveQueueUseCase({required this.queueRepository});
  final QueueRepository queueRepository;

  @override
  FutureUnit execute(NoParams params) async {
    return queueRepository.leaveQueue();
  }
}
