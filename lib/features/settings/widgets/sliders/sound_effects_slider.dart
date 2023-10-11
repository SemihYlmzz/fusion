import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/cubits/audio/audio.dart';
import '../../../../app/gen/assets.gen.dart';
import '../../../../app/gen/l10n/l10n.dart';
import '../../../../blocs/blocs.dart';
import '../../../../repositories/repositories.dart';
import 'base_slider.dart';

class SoundEffectsSlider extends StatefulWidget {
  const SoundEffectsSlider({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefsModel devicePrefs;

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
      volumeText: L10n.current.soundEffects,
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
               devicePrefs: widget.devicePrefs.copyWith(
                  soundEffectsSoundVolume: newValue,
                ),
              ),
            );
      },
    );
  }
}
