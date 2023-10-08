import 'package:fusion/core/network/network_info.dart';

import '../../initialize/injection_container.dart';
import 'datasource/datasource.dart';
import 'delete_request_datasource.dart';
import 'delete_request_repository.dart';

class DeleteRequestRepositoryInjection {
  static Future<void> inject() async {
    getIt
      ..registerSingleton<DeleteRequestDatasource>(
        DeleteRequestDataSourceFirebaseImpl(),
      )
      ..registerSingleton<DeleteRequestRepository>(
        DeleteRequestRepository(
          getIt<DeleteRequestDatasource>(),
          getIt<NetworkInfo>(),
        ),
      );
  }
}
