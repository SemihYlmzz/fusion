import 'package:flutter/material.dart';

import '../../../repositories/card_repository/data/datasource/card_datasource_local_impl.dart';
import 'game_card_preview.dart';


class DeckPreview extends StatelessWidget {
  const DeckPreview({required this.deck, super.key});
  final List<String> deck;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (CardDatas.cards[deck.elementAt(0)] != null)
              GameCardPreview(gameCard: CardDatas.cards[deck.elementAt(0)]!),
            if (CardDatas.cards[deck.elementAt(1)] != null)
              GameCardPreview(gameCard: CardDatas.cards[deck.elementAt(1)]!),
            if (CardDatas.cards[deck.elementAt(2)] != null)
              GameCardPreview(gameCard: CardDatas.cards[deck.elementAt(2)]!),
            if (CardDatas.cards[deck.elementAt(3)] != null)
              GameCardPreview(gameCard: CardDatas.cards[deck.elementAt(3)]!),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (CardDatas.cards[deck.elementAt(4)] != null)
              GameCardPreview(gameCard: CardDatas.cards[deck.elementAt(4)]!),
            if (CardDatas.cards[deck.elementAt(5)] != null)
              GameCardPreview(gameCard: CardDatas.cards[deck.elementAt(5)]!),
            if (CardDatas.cards[deck.elementAt(6)] != null)
              GameCardPreview(gameCard: CardDatas.cards[deck.elementAt(6)]!),
            if (CardDatas.cards[deck.elementAt(7)] != null)
              GameCardPreview(gameCard: CardDatas.cards[deck.elementAt(7)]!),
          ],
        ),
      ],
    );
  }
}
