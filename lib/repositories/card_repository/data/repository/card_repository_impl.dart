import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/exceptions/exceptions.dart';
import 'package:fusion/core/errors/failure/failure.dart';

import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/game_card_entity.dart';
import '../../domain/repository/card_repository.dart';
import '../datasource/card_datasource.dart';

class CardRepositoryImpl implements CardRepository {
  CardRepositoryImpl(
    CardDatasource cardDatasource,
  ) : _cardDatasource = cardDatasource;
  final CardDatasource _cardDatasource;

  @override
  FutureEither<GameCard> getCard({
    required String cardId,
  }) async {
    try {
      final gameCardModel = _cardDatasource.getCard(
        cardId: cardId,
      );
      return Right(gameCardModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
