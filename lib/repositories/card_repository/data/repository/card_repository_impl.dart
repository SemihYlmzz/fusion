import '../../../../utils/typedefs.dart';
import '../../domain/entities/card_entity.dart';
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
    return _cardDatasource.getCard(
      cardId: cardId,
    );
  }
}
