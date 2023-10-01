import '../../../../core/typedefs/typedefs.dart';
import '../entities/game_card_entity.dart';

// ignore: one_member_abstracts
abstract class CardRepository {
  FutureEither<GameCard> getCard({
    required String cardId,
  });
}
