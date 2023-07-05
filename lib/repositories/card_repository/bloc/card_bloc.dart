import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';
import 'package:fusion/repositories/card_repository/domain/usecase/get_card.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc({
    required this.getCardUseCase,
  }) : super(const CardEmpty()) {
    on<GetCardRequested>(onGetCardRequested);
  }
  final GetCardUseCase getCardUseCase;

  Future<void> onGetCardRequested(
    GetCardRequested event,
    Emitter<CardState> emit,
  ) async {
    emit(const CardLoading());
    final tryGetCard = await getCardUseCase.execute(
      CardIdParams(cardId: event.cardId),
    );

    tryGetCard.fold((failure) => emit(CardEmpty(errorMessage: failure.message)),
        (cardEntity) {
      emit(
        CardHasData(
          card: cardEntity,
        ),
      );
    });
  }
}