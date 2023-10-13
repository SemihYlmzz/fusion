part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState({
    this.errorMessage,
    this.gameModel,
  });
  final String? errorMessage;
  final GameModel? gameModel;

  GameState copyWith({
    String? errorMessage,
    GameModel? gameModel,
  });

  @override
  List<Object?> get props => [errorMessage, gameModel];
}

class GameEmpty extends GameState {
  const GameEmpty();

  @override
  GameState copyWith({
    String? errorMessage,
    GameModel? gameModel,
  }) {
    return const GameEmpty();
  }
}

class GameLoading extends GameState {
  const GameLoading({super.gameModel});
  @override
  GameState copyWith({
    String? errorMessage,
    GameModel? gameModel,
  }) {
    return GameLoading(gameModel: gameModel ?? this.gameModel);
  }
}

class GameHasError extends GameState {
  const GameHasError({
    required super.errorMessage,
    required this.errorCleanType,
    required this.errorDisplayType,
    super.gameModel,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;

  @override
  GameState copyWith({
    String? errorMessage,
    GameModel? gameModel,
    ErrorCleanType? errorCleanType,
    ErrorDisplayType? errorDisplayType,
  }) {
    return GameHasError(
      errorMessage: errorMessage ?? this.errorMessage,
      gameModel: gameModel ?? this.gameModel,
      errorCleanType: errorCleanType ?? this.errorCleanType,
      errorDisplayType: errorDisplayType ?? this.errorDisplayType,
    );
  }
}

class GameHasData extends GameState {
  const GameHasData({required super.gameModel});

  @override
  GameState copyWith({
    String? errorMessage,
    GameModel? gameModel,
  }) {
    return GameHasData(gameModel: gameModel ?? this.gameModel);
  }
}
