import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../repositories/queue_repository/bloc/queue_bloc.dart';
import '../../../home/view/home_screen.dart';
import '../../../queue/widgets/queue_rain_effect.dart';
import '../../../queue/widgets/queue_timer.dart';

class QueueView extends StatelessWidget {
  const QueueView({required this.queueState, super.key});

  final QueueState queueState;

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
              // Text(userState.user?.username ?? ''),
              Padding(
                padding: SharedPaddings.all32,
                child: GradientTextButton(
                  'MATCH MAKING',
                  style: GoogleFonts.bangers(fontSize: 55),
                ),
              ),
              if (queueState is QueueLoading || queueState is QueueHasData)
                const Column(
                  children: [QueueTimer(), Text('Searching For Enemy')],
                ),
              GradientButton(
                text: 'Cancel',
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
