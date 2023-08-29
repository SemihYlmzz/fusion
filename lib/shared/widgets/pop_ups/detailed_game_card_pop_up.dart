import 'package:flutter/material.dart' hide Element;
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:fusion/features/settings/widgets/widgets.dart';
import 'package:fusion/gen/assets.gen.dart';
import 'package:fusion/repositories/card_repository/data/datasource/card_datasource_local_impl.dart';
import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:shared_constants/shared_constants.dart';

import 'package:shared_widgets/shared_widgets.dart';

class DetailedGameCardPopUp extends StatefulWidget {
  const DetailedGameCardPopUp({required this.gameCard, super.key});
  final GameCard gameCard;
  @override
  State<DetailedGameCardPopUp> createState() => _DetailedGameCardPopUpState();
}

class _DetailedGameCardPopUpState extends State<DetailedGameCardPopUp> {
  bool isFire = false;
  bool isWater = false;
  bool isEarth = false;
  bool isAir = false;

  Future<void> popBack(BuildContext context) async {
    await Future<void>.delayed(Duration.zero);
    if (mounted) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    isFire = widget.gameCard.elements.contains(Element.fire);
    isWater = widget.gameCard.elements.contains(Element.water);
    isEarth = widget.gameCard.elements.contains(Element.earth);
    isAir = widget.gameCard.elements.contains(Element.air);

    return ClosableAnimatedScaffold(
      backgroundColor: Colors.black87,
      child: GestureDetector(
        onTap: () {
          if (mounted) {
            Navigator.pop(context);
          }
        },
        child: BaseColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tilt(
              clipBehavior: Clip.none,
              lightConfig:
                  const LightConfig(enableReverse: true, disable: true),
              shadowConfig: const ShadowConfig(
                disable: true,
              ),
              tiltConfig: const TiltConfig(
                enableReverse: true,
                filterQuality: FilterQuality.high,
              ),
              child: SizedBox(
                width: 350,
                height: 500,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 320,
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: SharedBorderRadius.circular32,
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFFc94c2d),
                              Color(0xFFFBF276),
                            ],
                          ),
                          width: 6,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFFF4D00),
                            blurRadius: 30,
                            spreadRadius: 4,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(
                            widget.gameCard.imagePath,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 175,
                        width: 300,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: SharedPaddings.all8,
                          child: Text(
                            CardDatas.cardDescriptions(
                                  context,
                                )[widget.gameCard.abilityId] ??
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
                    Positioned(
                      top: 20,
                      child: Text(
                        widget.gameCard.name,
                        style: GoogleFonts.bangers(
                          fontSize: 60,
                          shadows: [
                            const Shadow(blurRadius: 20),
                          ],
                        ),
                      ),
                    ),
                    Align(
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
                            widget.gameCard.power.toString(),
                            style: const TextStyle(fontSize: 44),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isFire)
                    Padding(
                      padding: SharedPaddings.horizontal4,
                      child: Image.asset(
                        Assets.images.cardPreview.selectedFire.path,
                        scale: 1.5,
                      ),
                    ),
                  if (isWater)
                    Padding(
                      padding: SharedPaddings.horizontal4,
                      child: Image.asset(
                        Assets.images.cardPreview.selectedWater.path,
                        scale: 1.5,
                      ),
                    ),
                  if (isEarth)
                    Padding(
                      padding: SharedPaddings.horizontal4,
                      child: Image.asset(
                        Assets.images.cardPreview.selectedEarth.path,
                        scale: 1.5,
                      ),
                    ),
                  if (isAir)
                    Padding(
                      padding: SharedPaddings.horizontal4,
                      child: Image.asset(
                        Assets.images.cardPreview.selectedAir.path,
                        scale: 1.5,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
