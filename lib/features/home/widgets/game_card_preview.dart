import 'package:flutter/material.dart' hide Element;
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../app/gen/assets.gen.dart';
import '../../../app/widgets/pop_ups/detailed_game_card_pop_up.dart';
import '../../../blocs/blocs.dart';
import '../../../repositories/card/data/datasource/card_datasource_local_impl.dart';
import '../../../repositories/card/domain/entities/game_card_entity.dart';
import '../../../repositories/device_prefs/domain/entities/device_prefs.dart';

class GameCardPreview extends StatelessWidget {
  const GameCardPreview({
    required this.gameCard,
    required this.index,
    super.key,
  });
  final GameCard gameCard;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, devicePrefsState) {
        return GestureDetector(
          onTap: () {
            if (devicePrefsState.devicePrefs.isHapticsOn) {
              HapticFeedback.heavyImpact();
            }
            showPopUp(
              DetailedGameCardPopUp(
                gameCard: gameCard,
              ),
              devicePrefsState.devicePrefs,
              context,
            );
          },
          child: Animate(
            effects: [
              MoveEffect(
                begin: const Offset(0, 75),
                end: Offset.zero,
                delay: Duration(milliseconds: 150 * index + 1),
              ),
              FadeEffect(
                delay: Duration(milliseconds: 150 * index + 1),
                duration: SharedDurations.ms500,
              ),
            ],
            child: SizedBox(
              width: 65,
              height: 115,
              child: Stack(
                children: [
                  ElementShadows(
                    gameCardElement: gameCard.element,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 60,
                      height: 95,
                      decoration: BoxDecoration(
                        borderRadius: SharedBorderRadius.circular12,
                        image: DecorationImage(
                          image: ResizeImage(
                            width: 60,
                            height: 90,
                            AssetImage(
                              gameCard.imagePath,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 37,
                      height: 37,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.images.cardPreview.cardPower.path,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(gameCard.power.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> showPopUp(
    Widget popUpWidget,
    DevicePrefs devicePrefs,
    BuildContext context,
  ) =>
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          if (devicePrefs.isHapticsOn) {
            HapticFeedback.mediumImpact();
          }
          return popUpWidget;
        },
      );
}

class ElementShadows extends StatelessWidget {
  const ElementShadows({required this.gameCardElement, super.key});
  final Element gameCardElement;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 95,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: CardDatas.elementGradientColor(gameCardElement),
        ),
        borderRadius: SharedBorderRadius.circular4,
        boxShadow: [
          BoxShadow(
            color: CardDatas.elementShadowColor(gameCardElement),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
