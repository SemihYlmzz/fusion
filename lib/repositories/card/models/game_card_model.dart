import 'package:equatable/equatable.dart';

class GameCardModel extends Equatable {
  const GameCardModel({
    required this.name,
    required this.element,
    required this.abilityId,
    required this.power,
    required this.imagePath,
    required this.cardId,
  });
  factory GameCardModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('name') ||
        !map.containsKey('element') ||
        !map.containsKey('abilityId') ||
        !map.containsKey('power') ||
        !map.containsKey('imagePath') ||
        !map.containsKey('cardId')) {
      throw Exception('Invalid map data');
    }
    return GameCardModel(
      name: map['name'] as String,
      element: GameElements.values.firstWhere(
        (e) => e.toString().split('.').last == map['element'],
      ),
      abilityId: map['abilityId'] as String,
      power: map['power'] as int,
      imagePath: map['imagePath'] as String,
      cardId: map['cardId'] as String,
    );
  }
  final String name;
  final GameElements element;
  final String abilityId;
  final int power;
  final String imagePath;
  final String cardId;

  GameCardModel copyWith({
    String? name,
    GameElements? element,
    String? abilityId,
    int? power,
    String? imagePath,
    String? cardId,
  }) {
    return GameCardModel(
      name: name ?? this.name,
      element: element ?? this.element,
      abilityId: abilityId ?? this.abilityId,
      power: power ?? this.power,
      imagePath: imagePath ?? this.imagePath,
      cardId: cardId ?? this.cardId,
    );
  }

  @override
  List<Object?> get props => [
        name,
        element,
        abilityId,
        power,
        imagePath,
        cardId,
      ];

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
}

enum GameElements {
  fire,
  water,
  earth,
  air,
}
