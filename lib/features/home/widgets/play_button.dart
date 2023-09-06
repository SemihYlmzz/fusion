import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/l10n/l10n.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../audio/audio_cubit.dart';
import '../../../gen/assets.gen.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import '../../../shared/shared.dart';
import '../../queue/view/queue_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return GradientButton(
          text: context.l10n.play,
          onPressed: () {
            if (devicePrefs.isHapticsOn) {
              HapticFeedback.heavyImpact();
            }
            if (userState.user!.username == '') {
              openEnterNamePopUp(context);
              return;
            }
            context.read<AudioCubit>().playSoundEffect(
                  Assets.music.sfx.playButtonSfx,
                );
            context.goNamed(QueueScreen.name);
          },
        );
      },
    );
  }

  Future<void> openEnterNamePopUp(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        if (devicePrefs.isHapticsOn) {
          HapticFeedback.heavyImpact();
        }

        return const EnterNamePopUp();
      },
    );
  }
}
