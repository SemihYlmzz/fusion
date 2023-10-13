import 'package:fusion/repositories/repositories.dart';

import '../../../initialize/injection_container.dart';

import 'game_bloc.dart';

class GameBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<GameBloc>(
      () => GameBloc(
        gameRepository: getIt<GameRepository>(),
      ),
    );
  }
}
