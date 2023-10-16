part of 'game_bloc.dart';

sealed class GameEvent {
  const GameEvent({
    this.errorCleanType = ErrorCleanType.immediately,
    this.errorDisplayType = ErrorDisplayType.snackBar,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

final class WatchGameWithGameIdRequested extends GameEvent {
  const WatchGameWithGameIdRequested({
    required this.gameId,
  });
  final String gameId;
}

final class AcceptGameRequested extends GameEvent {
  const AcceptGameRequested();
}

final class OpponentEscapedWinRequested extends GameEvent {
  const OpponentEscapedWinRequested();
}

final class WinTheGameRequested extends GameEvent {
  const WinTheGameRequested();
}

final class ClearGameErrorMessageRequested extends GameEvent {
  const ClearGameErrorMessageRequested();
}

final class ClearGameRequested extends GameEvent {
  const ClearGameRequested();
}
