import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';
import 'package:fusion/utils/typedefs.dart';

// ignore: one_member_abstracts
abstract class CardRepository {
  FutureEither<GameCard> getCard({
    required String cardId,
  });
}
