import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/cubits/audio/audio.dart';
import '../../../../app/gen/l10n/l10n.dart';
import '../../../../blocs/blocs.dart';
import '../../../../repositories/repositories.dart';
import 'base_slider.dart';

class GeneralSoundSlider extends StatefulWidget {
  const GeneralSoundSlider({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefsModel devicePrefs;

  @override
  State<GeneralSoundSlider> createState() => _GeneralSoundSliderState();
}

class _GeneralSoundSliderState extends State<GeneralSoundSlider> {
  double generalVolumeLevelController = 1;
  @override
  void initState() {
    generalVolumeLevelController = widget.devicePrefs.generalSoundVolume;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSlider(
      volumeLevel: generalVolumeLevelController,
      volumeText: L10n.current.general,
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
