import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/gen/l10n/l10n.dart';
import '../../../../blocs/blocs.dart';
import '../../../../repositories/repositories.dart';
import 'base_slider.dart';

class DialoguesSlider extends StatefulWidget {
  const DialoguesSlider({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefsModel devicePrefs;

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
      volumeText: L10n.current.dialogues,
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
