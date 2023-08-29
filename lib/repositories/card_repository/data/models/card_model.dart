import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';

class CardModel extends GameCard {
  const CardModel({
    required super.name,
    required super.elements,
    required super.abilityId,
    required super.power,
    required super.imagePath,
    required super.cardId,
  });
  factory CardModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('name') ||
        !map.containsKey('elements') ||
        !map.containsKey('abilityId') ||
        !map.containsKey('power') ||
        !map.containsKey('imagePath') ||
        !map.containsKey('cardId')) {
      throw Exception('Invalid map data');
    }
    final settedElementList = <Element>[];

    for (final elements in map['elements'] as List) {
      settedElementList.add(
        Element.values.firstWhere(
          (e) => e.toString().split('.').last == elements,
        ),
      );
    }
    return CardModel(
      name: map['name'] as String,
      elements: settedElementList,
      abilityId: map['abilityId'] as String,
      power: map['power'] as int,
      imagePath: map['imagePath'] as String,
      cardId: map['cardId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'element': elements.toString().split('.').last,
      'abilityId': abilityId,
      'power': power,
      'imagePath': imagePath,
      'cardId': cardId,
    };
  }

  CardModel fromEntity(GameCard cardEntity) {
    return CardModel(
      name: cardEntity.name,
      elements: cardEntity.elements,
      abilityId: cardEntity.abilityId,
      power: cardEntity.power,
      imagePath: cardEntity.imagePath,
      cardId: cardEntity.cardId,
    );
  }

  static GameCard toEntity(CardModel authModel) {
    return GameCard(
      name: authModel.name,
      elements: authModel.elements,
      abilityId: authModel.abilityId,
      power: authModel.power,
      imagePath: authModel.imagePath,
      cardId: authModel.cardId,
    );
  }
}
