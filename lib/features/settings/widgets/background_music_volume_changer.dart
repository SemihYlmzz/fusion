import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'settings_volume_slider.dart';

class BackgroundMusicVolumeChanger extends StatelessWidget {
  const BackgroundMusicVolumeChanger({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  Widget build(BuildContext context) {
    return SettingsVolumeSlider(
      volumeLevel: devicePrefs.backGroundSoundVolume,
      volumeText: AppLocalizations.of(context).backgroundMusic,
      onChanged: (newValue) {
        context.read<DevicePrefsBloc>().add(
              UpdateDevicePrefs(
                devicePrefs.copyWith(
                  backGroundSoundVolume: newValue,
                ),
              ),
            );
      },
    );
  }
}