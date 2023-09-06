import '../../../initialize/injection_container.dart';
import '../domain/usecase/usecases/check_queue.dart';
import '../domain/usecase/usecases/enter_queue.dart';
import '../domain/usecase/usecases/leave_queue.dart';
import 'queue_bloc.dart';

class QueueBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<QueueBloc>(
      () => QueueBloc(
        enterQueueUseCase: getIt<EnterQueueUseCase>(),
        leaveQueueUseCase: getIt<LeaveQueueUseCase>(),
        checkQueueUseCase: getIt<CheckQueueUseCase>(),
      ),
    );
  }
}
