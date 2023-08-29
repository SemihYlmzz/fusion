import 'package:equatable/equatable.dart';

class GameCard extends Equatable {
  const GameCard({
    required this.name,
    required this.elements,
    required this.abilityId,
    required this.power,
    required this.imagePath,
    required this.cardId,
  });
  final String name;
  final List<Element> elements;
  final String abilityId;
  final int power;
  final String imagePath;
  final String cardId;

  GameCard copyWith({
    String? name,
    List<Element>? elements,
    String? abilityId,
    int? power,
    String? imagePath,
    String? cardId,
  }) {
    return GameCard(
      name: name ?? this.name,
      elements: elements ?? this.elements,
      abilityId: abilityId ?? this.abilityId,
      power: power ?? this.power,
      imagePath: imagePath ?? this.imagePath,
      cardId: cardId ?? this.cardId,
    );
  }

  @override
  List<Object?> get props => [
        name,
        elements,
        abilityId,
        power,
        imagePath,
        cardId,
      ];
}

enum Element {
  fire,
  water,
  earth,
  air,
}
