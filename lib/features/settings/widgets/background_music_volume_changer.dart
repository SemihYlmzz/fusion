import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/audio/audio_cubit.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'settings_volume_slider.dart';

class BackgroundMusicVolumeChanger extends StatefulWidget {
  const BackgroundMusicVolumeChanger({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  State<BackgroundMusicVolumeChanger> createState() =>
      _BackgroundMusicVolumeChangerState();
}

class _BackgroundMusicVolumeChangerState
    extends State<BackgroundMusicVolumeChanger> {
  double volumeLevelController = 1;
  @override
  void initState() {
    volumeLevelController = widget.devicePrefs.backGroundSoundVolume;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsVolumeSlider(
      volumeLevel: volumeLevelController,
      volumeText: AppLocalizations.of(context).backgroundMusic,
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
