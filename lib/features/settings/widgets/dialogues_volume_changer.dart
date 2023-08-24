import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'settings_volume_slider.dart';

class DialoguesVolumeChanger extends StatefulWidget {
  const DialoguesVolumeChanger({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  State<DialoguesVolumeChanger> createState() => _DialoguesVolumeChangerState();
}

class _DialoguesVolumeChangerState extends State<DialoguesVolumeChanger> {
  double dialogsVolumeLevelController = 1;
  @override
  void initState() {
    dialogsVolumeLevelController = widget.devicePrefs.dialogsSoundVolume;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsVolumeSlider(
      volumeText: AppLocalizations.of(context).dialogues,
      volumeLevel: dialogsVolumeLevelController,
      onChanged: (val) {
        if (val == null) {
          return;
        }
        dialogsVolumeLevelController = val;
        setState(() {});
      },
      onChangeEnd: (newValue) {
        context.read<DevicePrefsBloc>().add(
              UpdateDevicePrefs(
                widget.devicePrefs.copyWith(
                  dialogsSoundVolume: newValue,
                ),
              ),
            );
      },
    );
  }
}
