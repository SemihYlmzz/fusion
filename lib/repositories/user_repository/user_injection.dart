import 'package:fusion/injection_container.dart';
import 'package:fusion/repositories/user_repository/domain/usecase/usecases/change_username.dart';
import 'package:fusion/repositories/user_repository/domain/usecase/usecases/update_user_with_uid.dart';

import 'data/datasource/user_datasource.dart';
import 'data/datasource/user_datasource_firestore_impl.dart';
import 'data/repository/user_repository_impl.dart';
import 'domain/repository/user_repository.dart';
import 'domain/usecase/usecases/create_user.dart';
import 'domain/usecase/usecases/delete_user.dart';
import 'domain/usecase/usecases/read_user_with_uid.dart';
import 'domain/usecase/usecases/watch_user_with_uid.dart';

class UserRepositoryInjection {
  static Future<void> inject() async {
    getIt

      // UserDataSource <-connection-> Firebase
      ..registerSingleton<UserDatasource>(UserDataSourceFirebaseImpl())

      // UserRepository <-connection-> UserDataSource
      ..registerSingleton<UserRepository>(UserRepositoryImpl(getIt()))

      // UserUseCases <-connection-> UserRepository
      ..registerSingleton<CreateUserUseCase>(
        CreateUserUseCase(
          userRepository: getIt<UserRepository>(),
        ),
      )
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
      ..registerSingleton<UpdateUserWithUidUseCase>(
        UpdateUserWithUidUseCase(
          userRepository: getIt<UserRepository>(),
        ),
      )
      ..registerSingleton<DeleteUserUseCase>(
        DeleteUserUseCase(
          userRepository: getIt<UserRepository>(),
        ),
      )
      ..registerSingleton<ChangeUsernameUseCase>(
        ChangeUsernameUseCase(
          userRepository: getIt<UserRepository>(),
        ),
      );
  }
}
