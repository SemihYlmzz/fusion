import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/audio/audio_cubit.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'settings_volume_slider.dart';

class GeneralSoundVolumeChanger extends StatefulWidget {
  const GeneralSoundVolumeChanger({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  State<GeneralSoundVolumeChanger> createState() =>
      _GeneralSoundVolumeChangerState();
}

class _GeneralSoundVolumeChangerState extends State<GeneralSoundVolumeChanger> {
  double generalVolumeLevelController = 1;
  @override
  void initState() {
    generalVolumeLevelController = widget.devicePrefs.generalSoundVolume;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsVolumeSlider(
      volumeLevel: generalVolumeLevelController,
      volumeText: AppLocalizations.of(context).general,
      onChanged: (newValue) {
        generalVolumeLevelController = newValue ?? 0.75;

        context.read<AudioCubit>().setBackgroundMusicVolume(
              generalVolume: generalVolumeLevelController,
              newBackgroundMusicVolume:
                  widget.devicePrefs.backGroundSoundVolume,
            );
        setState(() {});
      },
      onChangeEnd: (newValue) {
        context.read<DevicePrefsBloc>().add(
              UpdateDevicePrefs(
                widget.devicePrefs.copyWith(
                  generalSoundVolume: newValue,
                ),
              ),
            );
      },
    );
  }
}
