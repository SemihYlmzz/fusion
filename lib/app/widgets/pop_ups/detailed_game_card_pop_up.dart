import 'package:flutter/material.dart' hide Element;
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../app/gen/assets.gen.dart';
import '../../../features/settings/widgets/widgets.dart';
import '../../../repositories/card/data/datasource/card_datasource_local_impl.dart';
import '../../../repositories/card/domain/entities/game_card_entity.dart';

class DetailedGameCardPopUp extends StatelessWidget {
  const DetailedGameCardPopUp({required this.gameCard, super.key});
  final GameCard gameCard;

  Future<void> popBack(BuildContext context) async {
    await Future<void>.delayed(Duration.zero);
    if (context.mounted) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClosableAnimatedScaffold(
      backgroundColor: Colors.black87,
      child: GestureDetector(
        onTap: () {
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
        child: BaseColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tilt(
              clipBehavior: Clip.none,
              lightConfig: const LightConfig(
                enableReverse: true,
                disable: true,
              ),
              shadowConfig: const ShadowConfig(
                disable: true,
              ),
              tiltConfig: const TiltConfig(
                enableReverse: true,
                filterQuality: FilterQuality.high,
                angle: 20,
              ),
              childLayout: ChildLayout(
                outer: [
                  TiltParallax(
                    size: const Offset(-15, -15),
                    child: SizedBox(
                      height: 480,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          gameCard.name,
                          style: GoogleFonts.bangers(
                            fontSize: 60,
                            shadows: [
                              const Shadow(blurRadius: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  TiltParallax(
                    size: const Offset(-15, -15),
                    child: SizedBox(
                      height: 500,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.images.cardPreview.cardPower.path,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              gameCard.power.toString(),
                              style: const TextStyle(fontSize: 44),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TiltParallax(
                    size: const Offset(-15, -15),
                    child: Container(
                      height: 280,
                      width: 300,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: SharedPaddings.all8,
                          child: Text(
                            CardDatas.cardDescriptions(
                                  context,
                                )[gameCard.abilityId] ??
                                '',
                            style: const TextStyle(
                              fontSize: 20,
                              shadows: [
                                Shadow(blurRadius: 5),
                                Shadow(blurRadius: 10),
                                Shadow(blurRadius: 15),
                                Shadow(blurRadius: 20),
                                Shadow(blurRadius: 25),
                                Shadow(blurRadius: 30),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                behind: [
                  TiltParallax(
                    size: const Offset(5, 5),
                    child: SizedBox(
                      height: 510,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: AnimatedContainer(
                          duration: SharedDurations.ms300,
                          width: 320,
                          height: 450,
                          decoration: BoxDecoration(
                            borderRadius: SharedBorderRadius.circular32,
                            gradient: LinearGradient(
                              colors: CardDatas.elementGradientColor(
                                gameCard.element,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CardDatas.elementShadowColor(
                                  gameCard.element,
                                ),
                                blurRadius: 30,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              child: SizedBox(
                width: 350,
                height: 500,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 310,
                      height: 440,
                      decoration: BoxDecoration(
                        borderRadius: SharedBorderRadius.circular32,
                        image: DecorationImage(
                          image: AssetImage(
                            gameCard.imagePath,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
