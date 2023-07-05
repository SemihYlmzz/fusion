import 'package:fusion/injection_container.dart';
import 'package:fusion/repositories/card_repository/bloc/card_bloc.dart';
import 'package:fusion/repositories/card_repository/domain/usecase/get_card.dart';

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
