import 'package:fusion/repositories/card_repository/data/datasource/card_datasource.dart';
import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';
import 'package:fusion/repositories/card_repository/domain/repository/card_repository.dart';
import 'package:fusion/utils/typedefs.dart';

class CardRepositoryImpl implements CardRepository {
  CardRepositoryImpl(
    CardDatasource cardDatasource,
  ) : _cardDatasource = cardDatasource;
  final CardDatasource _cardDatasource;

  @override
  FutureEither<GameCard> getCard({
    required String cardId,
  }) async {
    return _cardDatasource.getCard(
      cardId: cardId,
    );
  }
}
