import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'base_slider.dart';

class DialoguesSlider extends StatefulWidget {
  const DialoguesSlider({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  State<DialoguesSlider> createState() => _DialoguesSliderState();
}

class _DialoguesSliderState extends State<DialoguesSlider> {
  double dialogsVolumeLevelController = 1;
  @override
  void initState() {
    dialogsVolumeLevelController = widget.devicePrefs.dialogsSoundVolume;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSlider(
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
                widget.devicePrefs.copyWith(dialogsSoundVolume: newValue),
              ),
            );
      },
    );
  }
}
