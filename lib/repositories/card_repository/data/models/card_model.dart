import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';

class CardModel extends GameCard {
  const CardModel({
    required super.name,
    required super.element,
    required super.abilityId,
    required super.power,
    required super.imagePath,
    required super.cardId,
  });
  factory CardModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('name') ||
        !map.containsKey('element') ||
        !map.containsKey('abilityId') ||
        !map.containsKey('power') ||
        !map.containsKey('imagePath') ||
        !map.containsKey('cardId')) {
      throw Exception('Invalid map data');
    }
    return CardModel(
      name: map['name'] as String,
      element: Element.values.firstWhere(
        (e) => e.toString().split('.').last == map['element'],
      ),
      abilityId: map['abilityId'] as String,
      power: map['power'] as int,
      imagePath: map['imagePath'] as String,
      cardId: map['cardId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'element': element.toString().split('.').last,
      'abilityId': abilityId,
      'power': power,
      'imagePath': imagePath,
      'cardId': cardId,
    };
  }

  CardModel fromEntity(GameCard cardEntity) {
    return CardModel(
      name: cardEntity.name,
      element: cardEntity.element,
      abilityId: cardEntity.abilityId,
      power: cardEntity.power,
      imagePath: cardEntity.imagePath,
      cardId: cardEntity.cardId,
    );
  }

  static GameCard toEntity(CardModel authModel) {
    return GameCard(
      name: authModel.name,
      element: authModel.element,
      abilityId: authModel.abilityId,
      power: authModel.power,
      imagePath: authModel.imagePath,
      cardId: authModel.cardId,
    );
  }
}
