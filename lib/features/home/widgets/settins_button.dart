import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/cubits/audio/audio.dart';
import '../../../app/gen/assets.gen.dart';
import '../../../blocs/blocs.dart';
import '../../settings/settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isHapticsOn =
        context.watch<DevicePrefsBloc>().state.devicePrefs.isHapticsOn;
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        context.read<AudioCubit>().playSoundEffect(
              Assets.music.sfx.settingsButtonSfx,
            );
        if (isHapticsOn) {
          HapticFeedback.heavyImpact();
        }
        openSettingsPopUp(context);
      },
      iconSize: 44,
    );
  }

  Future<void> openSettingsPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const SettingsScreen();
      },
    );
  }
}
