import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/gen/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../blocs/blocs.dart';
import '../../home/view/home_screen.dart';
import '../widgets/queue_rain_effect.dart';
import '../widgets/queue_timer.dart';

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
