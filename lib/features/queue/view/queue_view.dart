import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/gen/l10n/l10n.dart';
import 'package:fusion/app/theme/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
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
                      style: GoogleFonts.bangers(fontSize: 55),
                    ),
                  ),
                  const Text(
                    'Searching for Opponent ...',
                  ),
                ],
              ),
              const Column(
                children: [
                  QueueTimer(),
                  UserQueueCard(),
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
  const UserQueueCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
