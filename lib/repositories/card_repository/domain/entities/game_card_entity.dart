import 'package:equatable/equatable.dart';

class GameCard extends Equatable {
  const GameCard({
    required this.name,
    required this.element,
    required this.abilityId,
    required this.power,
    required this.imagePath,
    required this.cardId,
  });
  final String name;
  final Element element;
  final String abilityId;
  final int power;
  final String imagePath;
  final String cardId;

  GameCard copyWith({
    String? name,
    Element? element,
    String? abilityId,
    int? power,
    String? imagePath,
    String? cardId,
  }) {
    return GameCard(
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
}

enum Element {
  fire,
  water,
  earth,
  air,
}
