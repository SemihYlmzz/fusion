part of 'card_bloc.dart';

sealed class CardEvent {
  const CardEvent({
    this.errorCleanType = ErrorCleanType.immediately,
    this.errorDisplayType = ErrorDisplayType.snackBar,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

final class GetCardRequested extends CardEvent {
  const GetCardRequested({
    required this.cardId,
    super.errorCleanType,
    super.errorDisplayType,
  });

  final String cardId;
}

final class ClearCardErrorMessageRequested extends CardEvent {
  const ClearCardErrorMessageRequested();
}
