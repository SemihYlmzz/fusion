import 'package:fusion/core/network/network_info.dart';

import '../../initialize/injection_container.dart';
import 'game.dart';

class GameRepositoryInjection {
  static Future<void> inject() async {
    getIt

      // UserDataSource <-connection-> Firebase
      ..registerSingleton<GameDatasource>(GameDataSourceFirebaseImpl())

      // UserRepository <-connection-> UserDataSource
      ..registerSingleton<GameRepository>(
        GameRepository(
          getIt<GameDatasource>(),
          getIt<NetworkInfo>(),
        ),
      );
  }
}
