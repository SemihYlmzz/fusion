import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/blocs/user/user_bloc.dart';

import '../../../repositories/repositories.dart';
import 'game_card_preview.dart';

class DeckPreview extends StatelessWidget {
  const DeckPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    final deck = userState.userModel?.deck;
    return deck != null
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (CardDatas.cards[deck.elementAt(0)] != null)
                    GameCardPreview(
                      gameCard: CardDatas.cards[deck.elementAt(0)]!,
                      index: 0,
                    ),
                  if (CardDatas.cards[deck.elementAt(1)] != null)
                    GameCardPreview(
                      gameCard: CardDatas.cards[deck.elementAt(1)]!,
                      index: 1,
                    ),
                  if (CardDatas.cards[deck.elementAt(2)] != null)
                    GameCardPreview(
                      gameCard: CardDatas.cards[deck.elementAt(2)]!,
                      index: 2,
                    ),
                  if (CardDatas.cards[deck.elementAt(3)] != null)
                    GameCardPreview(
                      gameCard: CardDatas.cards[deck.elementAt(3)]!,
                      index: 3,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (CardDatas.cards[deck.elementAt(4)] != null)
                    GameCardPreview(
                      gameCard: CardDatas.cards[deck.elementAt(4)]!,
                      index: 4,
                    ),
                  if (CardDatas.cards[deck.elementAt(5)] != null)
                    GameCardPreview(
                      gameCard: CardDatas.cards[deck.elementAt(5)]!,
                      index: 5,
                    ),
                  if (CardDatas.cards[deck.elementAt(6)] != null)
                    GameCardPreview(
                      gameCard: CardDatas.cards[deck.elementAt(6)]!,
                      index: 6,
                    ),
                  if (CardDatas.cards[deck.elementAt(7)] != null)
                    GameCardPreview(
                      gameCard: CardDatas.cards[deck.elementAt(7)]!,
                      index: 7,
                    ),
                ],
              ),
            ],
          )
        : const SizedBox();
  }
}
