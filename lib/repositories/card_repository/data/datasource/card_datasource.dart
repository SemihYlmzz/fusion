import '../../../../utils/typedefs.dart';
import '../../domain/entities/card_entity.dart';

// ignore: one_member_abstracts
abstract class CardDatasource {
  FutureEither<GameCard> getCard({required String cardId});
}
