import 'package:equatable/equatable.dart';

class GameCard extends Equatable {
  const GameCard({
    required this.name,
    required this.element,
    required this.abilityId,
    required this.power,
    required this.imagePath,
    required this.cardId,
    required this.abilityDescription,
  });
  final String name;
  final Element element;
  final String abilityId;
  final int power;
  final String imagePath;
  final String cardId;
  final String abilityDescription;

  GameCard copyWith({
    String? name,
    Element? element,
    String? abilityId,
    int? power,
    String? imagePath,
    String? cardId,
    String? abilityDescription,
  }) {
    return GameCard(
      name: name ?? this.name,
      element: element ?? this.element,
      abilityId: abilityId ?? this.abilityId,
      power: power ?? this.power,
      imagePath: imagePath ?? this.imagePath,
      cardId: cardId ?? this.cardId,
      abilityDescription: abilityDescription ?? this.abilityDescription,
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
        abilityDescription,
      ];
}

enum Element {
  fire,
  water,
  earth,
  air,
}
