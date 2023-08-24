import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/audio/audio_cubit.dart';
import 'package:fusion/gen/assets.gen.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'base_slider.dart';

class SoundEffectsSlider extends StatefulWidget {
  const SoundEffectsSlider({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  State<SoundEffectsSlider> createState() => _SoundEffectsSliderState();
}

class _SoundEffectsSliderState extends State<SoundEffectsSlider> {
  double soundEffectVolumeLevelController = 1;
  @override
  void initState() {
    soundEffectVolumeLevelController =
        widget.devicePrefs.soundEffectsSoundVolume;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSlider(
      volumeText: AppLocalizations.of(context).soundEffects,
      volumeLevel: soundEffectVolumeLevelController,
      onChangeStart: (val) async {
        await context.read<AudioCubit>().playSoundEffect(
              Assets.music.sfx.refreshDeckButtonSfx,
            );
      },
      onChanged: (newValue) {
        soundEffectVolumeLevelController = newValue ?? 0.75;

        context.read<AudioCubit>().setSoundEffectsVolume(
              newSoundEffectsVolume: soundEffectVolumeLevelController,
              generalVolume: widget.devicePrefs.generalSoundVolume,
            );
        setState(() {});
      },
      onChangeEnd: (newValue) {
        context.read<DevicePrefsBloc>().add(
              UpdateDevicePrefs(
                widget.devicePrefs.copyWith(
                  soundEffectsSoundVolume: newValue,
                ),
              ),
            );
      },
    );
  }
}