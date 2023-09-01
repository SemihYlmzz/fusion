import 'package:fusion/repositories/queue_repository/domain/usecase/usecases/enter_queue.dart';
import 'package:fusion/repositories/queue_repository/domain/usecase/usecases/leave_queue.dart';

import '../../../injection_container.dart';

import 'queue_bloc.dart';

class QueueBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<QueueBloc>(
      () => QueueBloc(
        enterQueueUseCase: getIt<EnterQueueUseCase>(),
        leaveQueueUseCase: getIt<LeaveQueueUseCase>(),
      ),
    );
  }
}
