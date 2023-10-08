
import '../../initialize/injection_container.dart';
import 'data/datasource/delete_request_datasource.dart';
import 'data/datasource/delete_request_datasource_firestore_impl.dart';
import 'data/repository/user_repository_impl.dart';
import 'domain/repository/delete_request_repository.dart';
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
        DeleteRequestRepositoryImpl(getIt(), getIt()),
      )

      // UserUseCases <-connection-> UserRepository

      ..registerSingleton<CreateDeleteRequestUseCase>(
        CreateDeleteRequestUseCase(
          deleteRepository: getIt<DeleteRequestRepository>(),
        ),
      );
  }
}
