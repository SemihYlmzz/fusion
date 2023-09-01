import 'package:fusion/injection_container.dart';

import 'data/datasource/queue_datasource.dart';
import 'data/datasource/queue_datasource_firestore_impl.dart';
import 'data/repository/user_repository_impl.dart';

import 'domain/repository/queue_repository.dart';
import 'domain/usecase/usecases/enter_queue.dart';
import 'domain/usecase/usecases/leave_queue.dart';

class QueueRepositoryInjection {
  static Future<void> inject() async {
    getIt

      // UserDataSource <-connection-> Firebase
      ..registerSingleton<QueueDatasource>(QueueDataSourceFirebaseImpl())

      // UserRepository <-connection-> UserDataSource
      ..registerSingleton<QueueRepository>(QueueRepositoryImpl(getIt()))

      // UserUseCases <-connection-> UserRepository
      ..registerSingleton<EnterQueueUseCase>(
        EnterQueueUseCase(
          queueRepository: getIt<QueueRepository>(),
        ),
      )
      ..registerSingleton<LeaveQueueUseCase>(
        LeaveQueueUseCase(
          queueRepository: getIt<QueueRepository>(),
        ),
      );
  }
}
