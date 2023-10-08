import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/repositories/card/errors/get_card_exceptions.dart';

import '../../../core/typedefs/typedefs.dart';
import 'card_datasource.dart';
import 'models/game_card_model.dart';

class CardRepository {
  CardRepository(
    CardDatasource cardDatasource,
  ) : _cardDatasource = cardDatasource;
  final CardDatasource _cardDatasource;

  FutureEither<GameCardModel> getCard({
    required String cardId,
  }) async {
    try {
      final gameCardModel = _cardDatasource.getCard(
        cardId: cardId,
      );
      return Right(gameCardModel);
    } on GetCardExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
