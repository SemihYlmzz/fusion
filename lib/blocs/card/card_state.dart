part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState({
    this.errorMessage,
    this.card,
  });
  final String? errorMessage;
  final GameCardModel? card;

  CardState copyWith({
    String? errorMessage,
    GameCardModel? card,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        card,
      ];
}

class CardEmpty extends CardState {
  const CardEmpty();

  @override
  CardState copyWith({String? errorMessage, GameCardModel? card}) {
    return const CardEmpty();
  }
}

class CardLoading extends CardState {
  const CardLoading({super.card});
  @override
  CardState copyWith({String? errorMessage, GameCardModel? card}) {
    return CardLoading(card: card ?? this.card);
  }
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

  @override
  CardState copyWith({
    String? errorMessage,
    GameCardModel? card,
    ErrorCleanType? errorCleanType,
    ErrorDisplayType? errorDisplayType,
  }) {
    return CardHasError(
      card: card ?? this.card,
      errorCleanType: errorCleanType ?? this.errorCleanType,
      errorDisplayType: errorDisplayType ?? this.errorDisplayType,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class CardHasData extends CardState {
  const CardHasData({required super.card});

  @override
  CardState copyWith({String? errorMessage, GameCardModel? card}) {
    return CardHasData(card: card ?? this.card);
  }
}
