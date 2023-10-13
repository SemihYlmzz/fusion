import 'package:flutter/material.dart';
import 'package:fusion/app/gen/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../blocs/blocs.dart';
import '../widgets/queue_rain_effect.dart';
import '../widgets/queue_timer.dart';

class MatchFoundView extends StatelessWidget {
  const MatchFoundView({
    required this.gameState,
    required this.userState,
    super.key,
  });
  final GameState gameState;
  final UserState userState;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      safeArea: true,
      body: Stack(
        children: [
          const QueueRainEffect(),
          BaseColumn(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: SharedPaddings.all32,
                child: GradientTextButton(
                  'MATCH FOUND',
                  style: GoogleFonts.bangers(fontSize: 55),
                ),
              ),
              Column(
                children: [
                  const QueueTimer(),
                  Text(
                    gameState.gameModel == null
                        ? 'GET READY'
                        : !gameState.gameModel!.acceptedUserIds
                                .contains(userState.userModel!.uid)
                            ? 'ENTERING THE GAME'
                            : 'WAITING OPPONENT TO ENTER',
                  ),
                ],
              ),
              GradientButton(
                text: L10n.current.cancel,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
