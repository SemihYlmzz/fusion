import '../entities/card_entity.dart';
import '../../../../utils/typedefs.dart';

// ignore: one_member_abstracts
abstract class CardRepository {
  FutureEither<GameCard> getCard({
    required String cardId,
  });
}
