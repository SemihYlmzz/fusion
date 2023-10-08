part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState({
    this.errorMessage,
    this.card,
  });
  final String? errorMessage;
  final GameCardModel? card;

  @override
  List<Object?> get props => [
        errorMessage,
        card,
      ];
}

class CardEmpty extends CardState {
  const CardEmpty();
}

class CardLoading extends CardState {
  const CardLoading({super.card});
}

class CardHasError extends CardState {
  const CardHasError({required super.errorMessage, super.card});
}

class CardHasData extends CardState {
  const CardHasData({required super.card});
}
