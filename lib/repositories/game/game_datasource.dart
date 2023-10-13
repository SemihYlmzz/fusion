import 'models/game_model.dart';

abstract class GameDatasource {
  Stream<GameModel> watchGameWithGameId({required String gameId});
  Future<void> acceptGame();
}
