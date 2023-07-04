import '../domain/usecase/get_card.dart';

import '../../../injection_container.dart';

import 'card_bloc.dart';

class CardBlocInjection {
  static void inject() {
    // CardBloc <-connection-> UseCases
    getIt.registerFactory<CardBloc>(
      () => CardBloc(
        getCardUseCase: getIt<GetCardUseCase>(),
      ),
    );
  }
}
