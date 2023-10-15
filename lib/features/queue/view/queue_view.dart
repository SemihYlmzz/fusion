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
    final isCurrentUserAcceptTheGame = gameState.gameModel != null &&
        gameState.gameModel!.acceptedUserIds.contains(userState.userModel?.uid);
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
                  const Text(
                    'Searching for Opponent ...',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: SharedPaddings.bottom32,
                    child: EnemyQueueCard(
                      username: gameState.gameModel?.player1.username,
                      userPoint: '20',
                    ),
                  ),
                  const QueueTimer(),
                  const Padding(
                    padding: SharedPaddings.top32,
                    child: UserQueueCard(),
                  ),
                ],
              ),
              GradientButton(
                text: L10n.current.cancel,
                onPressed: () {
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

class UserQueueCard extends StatelessWidget {
  const UserQueueCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: SharedPaddings.right12,
                      child: Text(
                        '20',
                        style: TextStyle(
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
                child: const Center(
                  child: Padding(
                    padding: SharedPaddings.horizontal8,
                    child: Text(
                      'CL4Y',
                      style: TextStyle(
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

class EnemyQueueCard extends StatelessWidget {
  const EnemyQueueCard({
    required this.username,
    required this.userPoint,
    super.key,
  });
  final String? username;
  final String? userPoint;

  @override
  Widget build(BuildContext context) {
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
              alignment:
                  username == null ? Alignment.center : Alignment.centerRight,
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
                        userPoint ?? '0',
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
              alignment:
                  username == null ? Alignment.center : Alignment.centerLeft,
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
                    child: username == null
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
                            text: username!,
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
