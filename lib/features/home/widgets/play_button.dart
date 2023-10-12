import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/widgets/pop_ups/change_username_pop_up.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/cubits/audio/audio.dart';
import '../../../app/gen/assets.gen.dart';
import '../../../app/gen/l10n/l10n.dart';
import '../../../blocs/blocs.dart';
import '../../queue/view/queue_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isHapticsOn = context.select((DevicePrefsBloc devicePrefsBloc) {
      return devicePrefsBloc.state.devicePrefs.isHapticsOn;
    });
    final username = context.select((UserBloc userBloc) {
      return userBloc.state.userModel?.username;
    });

    return GradientButton(
      text: L10n.current.play,
      onPressed: () {
        if (isHapticsOn) {
          HapticFeedback.heavyImpact();
        }
        if (username == null) {
          return;
        }
        if (username == '') {
          openEnterNamePopUp(context, isHapticsOn: isHapticsOn);
          return;
        }
        context.read<AudioCubit>().playSoundEffect(
              Assets.music.sfx.playButtonSfx,
            );
        context.goNamed(QueueScreen.name);
      },
    );
  }

  Future<void> openEnterNamePopUp(
    BuildContext context, {
    required bool isHapticsOn,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        if (isHapticsOn) {
          HapticFeedback.heavyImpact();
        }

        return const EnterNamePopUp();
      },
    );
  }
}
