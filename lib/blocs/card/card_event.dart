part of 'card_bloc.dart';

sealed class CardEvent {
  const CardEvent({
    this.errorCleanType = ErrorCleanType.afterDisplay,
  });
  final ErrorCleanType errorCleanType;
}

final class GetCardRequested extends CardEvent {
  const GetCardRequested({required this.cardId, super.errorCleanType});

  final String cardId;
}

final class ClearCardErrorMessageRequested extends CardEvent {
  const ClearCardErrorMessageRequested();
}
