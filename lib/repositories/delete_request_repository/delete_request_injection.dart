import '../../initialize/injection_container.dart';
import 'domain/usecase/usecases/check_delete_request.dart';
import 'data/datasource/delete_request_datasource.dart';

import 'data/datasource/user_datasource_firestore_impl.dart';
import 'data/repository/user_repository_impl.dart';
import 'domain/repository/delete_request_repository.dart';
import 'domain/usecase/usecases/cancel_delete_request.dart';
import 'domain/usecase/usecases/create_delete_request.dart';

class DeleteRequestRepositoryInjection {
  static Future<void> inject() async {
    getIt

      // UserDataSource <-connection-> Firebase
      ..registerSingleton<DeleteRequestDatasource>(
        DeleteRequestDataSourceFirebaseImpl(),
      )

      // UserRepository <-connection-> UserDataSource
      ..registerSingleton<DeleteRequestRepository>(
        DeleteRequestRepositoryImpl(getIt()),
      )

      // UserUseCases <-connection-> UserRepository
      ..registerSingleton<CancelDeleteRequestUseCase>(
        CancelDeleteRequestUseCase(
          deleteRepository: getIt<DeleteRequestRepository>(),
        ),
      )
      ..registerSingleton<CreateDeleteRequestUseCase>(
        CreateDeleteRequestUseCase(
          deleteRepository: getIt<DeleteRequestRepository>(),
        ),
      )
      ..registerSingleton<CheckDeleteRequestUseCase>(
        CheckDeleteRequestUseCase(
          deleteRepository: getIt<DeleteRequestRepository>(),
        ),
      );
  }
}
