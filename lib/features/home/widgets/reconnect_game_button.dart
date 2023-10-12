import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/game/view/game_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../blocs/blocs.dart';

class ReconnectGameButton extends StatelessWidget {
  const ReconnectGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isHapticsOn = context.select((DevicePrefsBloc devicePrefsBloc) {
      return devicePrefsBloc.state.devicePrefs.isHapticsOn;
    });

    return GradientButton(
      text: 'Reconnect to Game',
      onPressed: () {
        if (isHapticsOn) {
          HapticFeedback.heavyImpact();
        }

        context.goNamed(GameScreen.name);
      },
    );
  }
}
