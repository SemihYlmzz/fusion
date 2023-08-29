import 'package:flutter/material.dart' hide Element;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
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
            context.read<DevicePrefsBloc>().add(
                  UpdateDevicePrefs(
                    devicePrefsState.devicePrefs.copyWith(
                      isTermsAndConditionsAccepted: false,
                    ),
                  ),
                );
          },
          child: SizedBox(
            width: 65,
            height: 115,
            child: Stack(
              children: [
                ElementShadows(
                  gameCardElement: gameCard.elements,
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
}

class ElementShadows extends StatelessWidget {
  const ElementShadows({required this.gameCardElement, super.key});
  final List<Element> gameCardElement;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 115,
      child: Column(
        children: [
          Row(
            children: [
              if (gameCardElement.contains(Element.fire))
                Container(
                  width: 32,
                  height: 48,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFFc94c2d),
                        Color(0xFFFBF276),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFF4D00),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                )
              else
                const SizedBox(
                  width: 32,
                  height: 48,
                ),
              if (gameCardElement.contains(Element.water))
                Container(
                  width: 32,
                  height: 48,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color(0xFF33658E),
                        Color(0xFF87F8F8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF3F7A9E),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(8)),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              if (gameCardElement.contains(Element.earth))
                Container(
                  width: 32,
                  height: 48,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF46966B),
                        Color(0xFF8BB987),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF2E7900),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(8)),
                  ),
                )
              else
                const SizedBox(
                  width: 32,
                  height: 48,
                ),
              if (gameCardElement.contains(Element.air))
                Container(
                  width: 32,
                  height: 48,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFADADAD),
                        Color(0xFFEBEBEB),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(8)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
