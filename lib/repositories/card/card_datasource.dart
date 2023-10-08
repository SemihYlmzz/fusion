import 'models/game_card_model.dart';

// ignore: one_member_abstracts
abstract class CardDatasource {
  GameCardModel getCard({required String cardId});
}
