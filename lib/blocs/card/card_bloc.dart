import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';
import 'package:fusion/repositories/repositories.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc({
    required CardRepository cardRepository,
  })  : _cardRepository = cardRepository,
        super(const CardEmpty()) {
    on<GetCardRequested>(_onGetCardRequested);
    on<ClearCardErrorMessageRequested>(_onClearCardErrorMessageRequested);
  }
  final CardRepository _cardRepository;

  Future<void> _onGetCardRequested(
    GetCardRequested event,
    Emitter<CardState> emit,
  ) async {
    emit(const CardLoading());
    final tryGetCard = await _cardRepository.getCard(
      cardId: event.cardId,
    );

    tryGetCard.fold(
      (failure) => emit(
        CardHasError(          errorDisplayType: event.errorDisplayType,

          errorMessage: failure.message,
          errorCleanType: event.errorCleanType,
        ),
      ),
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
