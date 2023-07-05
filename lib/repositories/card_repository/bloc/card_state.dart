part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState({
    this.errorMessage,
    this.card,
  });
  final String? errorMessage;
  final GameCard? card;

  @override
  List<Object?> get props => [
        errorMessage,
        card,
      ];
}

class CardEmpty extends CardState {
  const CardEmpty({super.card, super.errorMessage});
}

class CardLoading extends CardState {
  const CardLoading({super.card, super.errorMessage});
}

class CardHasData extends CardState {
  const CardHasData({required super.card, super.errorMessage});
}
