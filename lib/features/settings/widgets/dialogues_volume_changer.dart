import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'settings_volume_slider.dart';

class DialoguesVolumeChanger extends StatelessWidget {
  const DialoguesVolumeChanger({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;
  @override
  Widget build(BuildContext context) {
    return SettingsVolumeSlider(
      volumeText: AppLocalizations.of(context).dialogues,
      volumeLevel: devicePrefs.dialogsSoundVolume,
      onChanged: (newValue) {
        context.read<DevicePrefsBloc>().add(
              UpdateDevicePrefs(
                devicePrefs.copyWith(
                  dialogsSoundVolume: newValue,
                ),
              ),
            );
      },
    );
  }
}
