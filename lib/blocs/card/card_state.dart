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
  const CardHasError({
    required super.errorMessage,
    required this.errorCleanType,
    required this.errorDisplayType,
    super.card,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

class CardHasData extends CardState {
  const CardHasData({required super.card});
}
