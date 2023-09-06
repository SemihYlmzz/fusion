import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/l10n/l10n.dart';

import '../../../../audio/audio_cubit.dart';
import '../../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'base_slider.dart';

class BackgroundMusicSlider extends StatefulWidget {
  const BackgroundMusicSlider({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  State<BackgroundMusicSlider> createState() => _BackgroundMusicSliderState();
}

class _BackgroundMusicSliderState extends State<BackgroundMusicSlider> {
  double volumeLevelController = 1;
  @override
  void initState() {
    volumeLevelController = widget.devicePrefs.backGroundSoundVolume;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSlider(
      volumeLevel: volumeLevelController,
      volumeText: context.l10n.backgroundMusic,
      onChanged: (newValue) {
        volumeLevelController = newValue ?? 0.75;

        context.read<AudioCubit>().setBackgroundMusicVolume(
              newBackgroundMusicVolume: volumeLevelController,
              generalVolume: widget.devicePrefs.generalSoundVolume,
            );
        setState(() {});
      },
      onChangeEnd: (newValue) {
        context.read<DevicePrefsBloc>().add(
              UpdateDevicePrefs(
                widget.devicePrefs.copyWith(
                  backGroundSoundVolume: newValue,
                  generalSoundVolume: widget.devicePrefs.generalSoundVolume,
                ),
              ),
            );
      },
    );
  }
}
