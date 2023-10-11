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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return BlocBuilder<QueueBloc, QueueState>(
          builder: (context, queueState) {
            return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
              builder: (context, devicePrefsState) {
                return GradientButton(
                  isOutlined: queueState is QueueHasError,
                  text:
                      queueState is QueueHasError ? 'Retry' : L10n.current.play,
                  onPressed: queueState is QueueHasError
                      ? () {
                          context
                              .read<QueueBloc>()
                              .add(const ClearQueueErrorMessageRequested());
                        }
                      : () {
                          if (devicePrefsState.devicePrefs.isHapticsOn) {
                            HapticFeedback.heavyImpact();
                          }
                          if (userState.userModel!.username == '') {
                            openEnterNamePopUp(context, devicePrefsState);
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
          },
        );
      },
    );
  }

  Future<void> openEnterNamePopUp(
    BuildContext context,
    DevicePrefsState devicePrefsState,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        if (devicePrefsState.devicePrefs.isHapticsOn) {
          HapticFeedback.heavyImpact();
        }

        return const EnterNamePopUp();
      },
    );
  }
}
