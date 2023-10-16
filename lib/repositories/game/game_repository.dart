import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:fusion/repositories/game/errors/opponent_escaped_win_exceptions%20copy.dart';

import '../../core/typedefs/typedefs.dart';
import '../game/game.dart';

class GameRepository {
  GameRepository(this._gameDatasource, this._networkInfo);

  final GameDatasource _gameDatasource;
  final NetworkInfo _networkInfo;

  StreamEither<GameModel> watchGameWithGameId({required String gameId}) async* {
    if (!(await _networkInfo.isConnected)) {
      yield Left(Failure.network());
    }
    try {
      final gameStream = _gameDatasource.watchGameWithGameId(gameId: gameId);
      await for (final game in gameStream) {
        yield Right(game);
      }
    } on WatchGameWithGameIdExceptions catch (e) {
      yield Left(Failure(message: e.message));
    }
  }

  FutureUnit acceptGame() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      await _gameDatasource.acceptGame();
      return const Right(unit);
    } on AcceptGameExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  FutureUnit opponentEscapedWin() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      await _gameDatasource.opponentEscapedWin();
      return const Right(unit);
    } on OpponentEscapedWinExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  FutureUnit winTheGame() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      await _gameDatasource.winTheGame();
      return const Right(unit);
    } on WinTheGameExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
