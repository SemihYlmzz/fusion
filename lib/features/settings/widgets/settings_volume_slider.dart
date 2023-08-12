import 'package:flutter/material.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:shared_constants/shared_constants.dart';

class SettingsVolumeSlider extends StatelessWidget {
  const SettingsVolumeSlider({
    required this.volumeText,
    required this.volumeLevel,
    this.onChanged,
    super.key,
  });

  final String volumeText;
  final double volumeLevel;
  final DoubleCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SharedPaddings.left32,
          child: Text(volumeText),
        ),
        Slider(
          value: volumeLevel,
          onChanged: (newValue) {
            onChanged?.call(newValue);
          },
        ),
      ],
    );
  }
}
