import 'package:bloc/bloc.dart';
import '../domain/entities/card_entity.dart';
import '../domain/usecase/get_card.dart';
import 'package:equatable/equatable.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final GetCardUseCase getCardUseCase;

  CardBloc({
    required this.getCardUseCase,
  }) : super(const CardEmpty()) {
    on<GetCardRequested>(onGetCardRequested);
  }

  void onGetCardRequested(
    GetCardRequested event,
    Emitter<CardState> emit,
  ) async {
    emit(const CardLoading());
    var tryGetCard = await getCardUseCase.execute(
      CardIdParams(cardId: event.cardId),
    );

    tryGetCard.fold((failure) => emit(CardEmpty(errorMessage: failure.message)),
        (cardEntity) {
      emit(CardHasData(
        card: cardEntity,
        errorMessage: null,
      ));
    });
  }
}
