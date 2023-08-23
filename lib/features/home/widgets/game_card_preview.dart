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
          },
          child: SizedBox(
            width: 65,
            height: 115,
            child: Stack(
              children: [
                Container(
                  width: 65,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: switch (gameCard.element) {
                          Element.air => Colors.white,
                          Element.fire => Colors.redAccent,
                          Element.water => Colors.blueAccent,
                          Element.earth => Colors.brown.shade400,
                        },
                      ),
                    ],
                    borderRadius: SharedBorderRadius.circular8,
                    image: DecorationImage(
                      image: AssetImage(
                        gameCard.imagePath,
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
