import 'package:fusion/repositories/repositories.dart';

import '../../../initialize/injection_container.dart';
import 'card_bloc.dart';

class CardBlocInjection {
  static void inject() {
    // CardBloc <-connection-> UseCases
    getIt.registerFactory<CardBloc>(
      () => CardBloc(
        cardRepository: getIt<CardRepository>(),
      ),
    );
  }
}
