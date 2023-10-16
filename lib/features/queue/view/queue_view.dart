import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/gen/l10n/l10n.dart';
import 'package:fusion/app/theme/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:random_text_reveal/random_text_reveal.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../blocs/blocs.dart';
import '../../../repositories/repositories.dart';
import '../../home/view/home_screen.dart';
import '../widgets/widgets.dart';

class QueueView extends StatelessWidget {
  const QueueView({
    required this.queueState,
    required this.gameState,
    required this.userState,
    super.key,
  });

  final QueueState queueState;
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
              Column(
                children: [
                  Padding(
                    padding: SharedPaddings.all16,
                    child: GradientTextButton(
                      'MATCH MAKING',
                      style: GoogleFonts.bangers(fontSize: 58),
                    ),
                  ),
                  const QueueStatusText(),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: SharedPaddings.bottom32,
                    child: EnemyQueueCard(),
                  ),
                  if (gameState.gameModel == null ||
                      !gameState.gameModel!.acceptedUserIds
                          .contains(userState.userModel!.uid))
                    const QueueTimer()
                  else
                    const OpponentEscapeCountDown(),
                  const Padding(
                    padding: SharedPaddings.top32,
                    child: CurrentUserQueueCard(),
                  ),
                ],
              ),
              GradientButton(
                text: L10n.current.cancel,
                onPressed: () {
                  if (gameState.gameModel != null &&
                      gameState.gameModel!.acceptedUserIds
                          .contains(userState.userModel!.uid)) {
                    return;
                  }
                  if (queueState is QueueReadyToEnter && context.mounted) {
                    return context.goNamed(HomeScreen.name);
                  }
                  if (queueState is QueueHasData) {
                    return context
                        .read<QueueBloc>()
                        .add(const LeaveQueueRequested());
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QueueStatusText extends StatelessWidget {
  const QueueStatusText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    final gameState = context.watch<GameBloc>().state;

    String currentQueueStatusText() {
      const waitingOpponent = 'Waiting for Opponent ...';
      const matchFound = 'Match Found !';
      if (gameState.gameModel == null) {
        return 'Searching for Opponent ...';
      }

      if (!gameState.gameModel!.acceptedUserIds
          .contains(userState.userModel!.uid)) {
        return matchFound;
      } else {
        return waitingOpponent;
      }
    }

    return Text(
      currentQueueStatusText(),
      style: const TextStyle(fontSize: 15),
    );
  }
}

class CurrentUserQueueCard extends StatelessWidget {
  const CurrentUserQueueCard({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;

    return Animate(
      effects: const [
        MoveEffect(
          begin: Offset(-100, 0),
          end: Offset.zero,
        ),
        FadeEffect(),
      ],
      child: SizedBox(
        width: 257,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 81,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.black.shade800,
                  borderRadius: SharedBorderRadius.circular12,
                  border: Border.all(
                    color: AppColors.pink,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: SharedPaddings.right12,
                      child: Text(
                        '${userState.userModel!.leaguePoint}',
                        style: const TextStyle(
                          fontSize: 24,
                          shadows: [
                            Shadow(
                              blurRadius: 12,
                              color: Colors.white,
                            ),
                            Shadow(
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 200,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.black.shade800,
                  borderRadius: SharedBorderRadius.circular12,
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.orange,
                        AppColors.pink,
                      ],
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: SharedPaddings.horizontal8,
                    child: Text(
                      userState.userModel!.username,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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

class EnemyQueueCard extends StatefulWidget {
  const EnemyQueueCard({super.key});

  @override
  State<EnemyQueueCard> createState() => _EnemyQueueCardState();
}

class _EnemyQueueCardState extends State<EnemyQueueCard> {
  PlayerModel? enemyPlayer;

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameBloc>().state;
    final userState = context.watch<UserBloc>().state;

    if (gameState.gameModel != null) {
      gameState.gameModel!.player1.uid != userState.userModel!.uid
          ? enemyPlayer = gameState.gameModel!.player1
          : enemyPlayer = gameState.gameModel!.player2;
    }
    return Animate(
      effects: const [
        MoveEffect(
          begin: Offset(100, 0),
          end: Offset.zero,
        ),
        FadeEffect(),
      ],
      child: SizedBox(
        width: 257,
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: enemyPlayer == null
                  ? Alignment.center
                  : Alignment.centerRight,
              duration: SharedDurations.ms370,
              child: Container(
                width: 81,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.black.shade800,
                  borderRadius: SharedBorderRadius.circular12,
                  border: Border.all(
                    color: AppColors.pink,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: SharedPaddings.right12,
                      child: Text(
                        enemyPlayer == null
                            ? '0'
                            : '${enemyPlayer!.leaguePoint}',
                        style: const TextStyle(
                          fontSize: 24,
                          shadows: [
                            Shadow(
                              blurRadius: 12,
                              color: Colors.white,
                            ),
                            Shadow(
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedAlign(
              alignment: gameState.gameModel == null
                  ? Alignment.center
                  : Alignment.centerLeft,
              duration: SharedDurations.ms370,
              child: Container(
                width: 200,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.black.shade800,
                  borderRadius: SharedBorderRadius.circular12,
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.purple,
                        AppColors.pink,
                      ],
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: SharedPaddings.horizontal8,
                    child: enemyPlayer == null
                        ? const Text(
                            'Searching ...',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : RandomTextReveal(
                            text: enemyPlayer!.username,
                            initialText: 'Searching ...',
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            duration: SharedDurations.ms750,
                          ),
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
