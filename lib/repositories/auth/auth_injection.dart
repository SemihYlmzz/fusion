import 'package:fusion/core/network/network_info.dart';

import '../../initialize/injection_container.dart';
import 'auth_datasource.dart';
import 'auth_repository.dart';
import 'datasource/auth_datasource_firebase_impl.dart';

class AuthRepositoryInjection {
  static Future<void> inject() async {
    getIt
      ..registerLazySingleton<AuthDatasource>(AuthDatasourceFirebaseImpl.new)
      ..registerLazySingleton<AuthRepository>(
        () => AuthRepository(
          getIt<AuthDatasource>(),
          getIt<NetworkInfo>(),
        ),
      );
  }
}
