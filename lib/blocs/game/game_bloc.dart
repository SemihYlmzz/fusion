import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/repositories/repositories.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required GameRepository gameRepository,
  })  : _gameRepository = gameRepository,
        super(const GameEmpty()) {
    on<WatchGameWithGameIdRequested>(_onWatchGameWithGameIdRequested);
    on<AcceptGameRequested>(_onAcceptGameRequested);
    on<ClearGameErrorMessageRequested>(_onClearGameErrorMessageRequested);
    on<ClearGameRequested>(_onClearGameRequested);
    on<OpponentEscapedWinRequested>(_onOpponentEscapedWinRequested);
    on<WinTheGameRequested>(_onWinTheGameRequested);
  }

  final GameRepository _gameRepository;

  StreamSubscription<Either<Failure, GameModel>>? _gameSubscription;

  Future<void> _onWatchGameWithGameIdRequested(
    WatchGameWithGameIdRequested event,
    Emitter<GameState> emit,
  ) async {
    await _gameSubscription?.cancel();

    _gameSubscription = _gameRepository
        .watchGameWithGameId(gameId: event.gameId)
        .listen((result) {
      result.fold(
        (failure) async {
          _gameSubscription = null;
          emit(
            GameHasError(
              errorDisplayType: event.errorDisplayType,
              errorCleanType: event.errorCleanType,
              errorMessage: failure.message,
              gameModel: state.gameModel,
            ),
          );
        },
        (game) async {
          state is GameHasData
              ? emit(state.copyWith(gameModel: game))
              : emit(GameHasData(gameModel: game));
        },
      );
    });

    await _gameSubscription?.asFuture<void>();
  }

  Future<void> _onAcceptGameRequested(
    AcceptGameRequested event,
    Emitter<GameState> emit,
  ) async {
    final tryEnterGame = await _gameRepository.acceptGame();
    tryEnterGame.fold(
      (failure) => emit(
        GameHasError(
          errorDisplayType: event.errorDisplayType,
          errorCleanType: event.errorCleanType,
          gameModel: state.gameModel,
          errorMessage: failure.message,
        ),
      ),
      (success) => null,
    );
  }

  Future<void> _onClearGameErrorMessageRequested(
    ClearGameErrorMessageRequested event,
    Emitter<GameState> emit,
  ) async {
    if (state.gameModel == null) {
      emit(const GameEmpty());
    } else {
      emit(GameHasData(gameModel: state.gameModel));
    }
  }

  Future<void> _onClearGameRequested(
    ClearGameRequested event,
    Emitter<GameState> emit,
  ) async {
    await _gameSubscription?.cancel();
    _gameSubscription = null;
    emit(const GameEmpty());
  }

  Future<void> _onOpponentEscapedWinRequested(
    OpponentEscapedWinRequested event,
    Emitter<GameState> emit,
  ) async {
    final tryWinGame = await _gameRepository.opponentEscapedWin();
    tryWinGame.fold(
      (failure) => emit(
        GameHasError(
          errorDisplayType: event.errorDisplayType,
          errorCleanType: event.errorCleanType,
          gameModel: state.gameModel,
          errorMessage: failure.message,
        ),
      ),
      (success) => null,
    );
  }

  Future<void> _onWinTheGameRequested(
    WinTheGameRequested event,
    Emitter<GameState> emit,
  ) async {
    final tryWinGame = await _gameRepository.winTheGame();
    tryWinGame.fold(
      (failure) => emit(
        GameHasError(
          errorDisplayType: event.errorDisplayType,
          errorCleanType: event.errorCleanType,
          gameModel: state.gameModel,
          errorMessage: failure.message,
        ),
      ),
      (success) => null,
    );
  }

  @override
  Future<void> close() {
    _gameSubscription?.cancel();
    _gameSubscription = null;
    return super.close();
  }
}
