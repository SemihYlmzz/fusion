import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:fusion/features/settings/widgets/widgets.dart';
import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';
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
  Future<void> popBack(BuildContext context) async {
    await Future<void>.delayed(Duration.zero);
    if (mounted) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
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
              tiltConfig: const TiltConfig(enableReverse: true),
              borderRadius: SharedBorderRadius.circular32,
              child: Container(
                width: 320,
                height: 550,
                decoration: BoxDecoration(
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
            ),
          ],
        ),
      ),
    );
  }
}
