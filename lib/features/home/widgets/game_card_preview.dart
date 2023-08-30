import 'package:flutter/material.dart' hide Element;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/repositories/card_repository/data/datasource/card_datasource_local_impl.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:fusion/shared/widgets/pop_ups/detailed_game_card_pop_up.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../gen/assets.gen.dart';
import '../../../repositories/card_repository/domain/entities/card_entity.dart';

class GameCardPreview extends StatelessWidget {
  const GameCardPreview({
    required this.gameCard,
    super.key,
  });
  final GameCard gameCard;

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
              DetailedGameCard(
                gameCard: gameCard,
              ),
              devicePrefsState.devicePrefs,
              context,
            );
          },
          child: SizedBox(
            width: 65,
            height: 115,
            child: Stack(
              children: [
<<<<<<< HEAD
                ElementShadows(
=======
                ElementShadow(
>>>>>>> 41f9c62 (- Multi elemented gamecards removed.)
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
                        image: AssetImage(
                          gameCard.imagePath,
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

<<<<<<< HEAD
class ElementShadows extends StatelessWidget {
  const ElementShadows({required this.gameCardElement, super.key});
  final Element gameCardElement;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 115,
      child: Column(
        children: [
          Row(
            children: [
              if (gameCardElement == (Element.fire))
                elementShadow(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: const [
                    Color(0xFFc94c2d),
                    Color(0xFFFBF276),
                  ],
                  boxShadowColor: const Color(0xFFFF4D00),
                )
              else
                const SizedBox(
                  width: 32,
                  height: 48,
                ),
              if (gameCardElement == (Element.water))
                elementShadow(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color(0xFF33658E),
                    const Color(0xFF87F8F8),
                  ],
                  boxShadowColor: const Color(0xFF3F7A9E),
                ),
            ],
          ),
          Row(
            children: [
              if (gameCardElement == (Element.earth))
                elementShadow(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF46966B),
                    const Color(0xFF8BB987),
                  ],
                  boxShadowColor: const Color(0xFF2E7900),
                )
              else
                const SizedBox(
                  width: 32,
                  height: 48,
                ),
              if (gameCardElement == (Element.air))
                elementShadow(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color(0xFFADADAD),
                    const Color(0xFFEBEBEB),
                  ],
                  boxShadowColor: Colors.white,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Container elementShadow({
    required Alignment begin,
    required Alignment end,
    required List<Color> colors,
    required Color boxShadowColor,
  }) {
=======
class ElementShadow extends StatelessWidget {
  const ElementShadow({required this.gameCardElement, super.key});
  final Element gameCardElement;
  @override
  Widget build(BuildContext context) {
>>>>>>> 41f9c62 (- Multi elemented gamecards removed.)
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
