import 'package:fusion/repositories/queue/queue_repository.dart';

import '../../../initialize/injection_container.dart';
import 'queue_bloc.dart';

class QueueBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<QueueBloc>(
      () => QueueBloc(
        queueRepository: getIt<QueueRepository>(),
      ),
    );
  }
}
