import '../../initialize/injection_container.dart';
import 'data/datasource/user_datasource.dart';
import 'data/datasource/user_datasource_firestore_impl.dart';
import 'data/repository/user_repository_impl.dart';
import 'domain/repository/user_repository.dart';
import 'domain/usecase/usecases/change_username.dart';
import 'domain/usecase/usecases/read_user_with_uid.dart';
import 'domain/usecase/usecases/refresh_deck.dart';
import 'domain/usecase/usecases/watch_user_with_uid.dart';

class UserRepositoryInjection {
  static Future<void> inject() async {
    getIt

      // UserDataSource <-connection-> Firebase
      ..registerSingleton<UserDatasource>(UserDataSourceFirebaseImpl())

      // UserRepository <-connection-> UserDataSource
      ..registerSingleton<UserRepository>(UserRepositoryImpl(getIt(), getIt()))

      // UserUseCases <-connection-> UserRepository
      ..registerSingleton<ReadUserWithUidUseCase>(
        ReadUserWithUidUseCase(
          userRepository: getIt<UserRepository>(),
        ),
      )
      ..registerSingleton<WatchUserWithUidUseCase>(
        WatchUserWithUidUseCase(
          userRepository: getIt<UserRepository>(),
        ),
      )
      ..registerSingleton<ChangeUsernameUseCase>(
        ChangeUsernameUseCase(
          userRepository: getIt<UserRepository>(),
        ),
      )
      ..registerSingleton<RefreshDeckUseCase>(
        RefreshDeckUseCase(
          userRepository: getIt<UserRepository>(),
        ),
      );
  }
}
