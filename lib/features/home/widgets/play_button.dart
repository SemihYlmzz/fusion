import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/widgets/pop_ups/change_username_pop_up.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/cubits/audio/audio.dart';
import '../../../app/gen/assets.gen.dart';
import '../../../app/l10n/l10n.dart';
import '../../../blocs/blocs.dart';
import '../../../repositories/repositories.dart';
import '../../queue/view/queue_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefsModel devicePrefs;

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
            if (userState.userModel!.username == '') {
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
