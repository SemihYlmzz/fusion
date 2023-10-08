import 'package:fusion/core/network/network_info.dart';

import '../../initialize/injection_container.dart';
import 'datasource/user_datasource_firestore_impl.dart';
import 'user_datasource.dart';
import 'user_repository.dart';

class UserRepositoryInjection {
  static Future<void> inject() async {
    getIt

      // UserDataSource <-connection-> Firebase
      ..registerSingleton<UserDatasource>(UserDataSourceFirebaseImpl())

      // UserRepository <-connection-> UserDataSource
      ..registerSingleton<UserRepository>(
        UserRepository(
          getIt<UserDatasource>(),
          getIt<NetworkInfo>(),
        ),
      );
  }
}
