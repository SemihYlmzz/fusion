part of 'card_bloc.dart';

sealed class CardEvent {
  const CardEvent();
}

final class GetCardRequested extends CardEvent {
  const GetCardRequested(this.cardId);

  final String cardId;
}
final class ClearCardErrorMessageRequested extends CardEvent {
  const ClearCardErrorMessageRequested();
}
