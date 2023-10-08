import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/entities/game_card_entity.dart';
import '../domain/usecase/get_card.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc({
    required this.getCardUseCase,
  }) : super(const CardEmpty()) {
    on<GetCardRequested>(_onGetCardRequested);
    on<ClearCardErrorMessageRequested>(_onClearCardErrorMessageRequested);
  }
  final GetCardUseCase getCardUseCase;

  Future<void> _onGetCardRequested(
    GetCardRequested event,
    Emitter<CardState> emit,
  ) async {
    emit(const CardLoading());
    final tryGetCard = await getCardUseCase.execute(
      CardIdParams(cardId: event.cardId),
    );

    tryGetCard.fold(
      (failure) => emit(CardHasError(errorMessage: failure.message)),
      (cardEntity) => emit(CardHasData(card: cardEntity)),
    );
  }

  Future<void> _onClearCardErrorMessageRequested(
    ClearCardErrorMessageRequested event,
    Emitter<CardState> emit,
  ) async {
    if (state.card == null) {
      emit(const CardEmpty());
    } else {
      emit(CardHasData(card: state.card));
    }
  }
}
