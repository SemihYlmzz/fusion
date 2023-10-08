import 'package:fusion/core/network/network_info.dart';

import '../../initialize/injection_container.dart';
import 'datasource/queue_datasource_firestore_impl.dart';
import 'queue_datasource.dart';
import 'queue_repository.dart';

class QueueRepositoryInjection {
  static Future<void> inject() async {
    getIt
      ..registerSingleton<QueueDatasource>(QueueDataSourceFirebaseImpl())
      ..registerSingleton<QueueRepository>(
        QueueRepository(
          getIt<QueueDatasource>(),
          getIt<NetworkInfo>(),
        ),
      );
  }
}
