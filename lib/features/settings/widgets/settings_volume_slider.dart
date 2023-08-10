import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';

class SettingsVolumeSlider extends StatelessWidget {
  const SettingsVolumeSlider({
    required this.volumeText,
    required this.volumeLevel,
    super.key,
  });

  final String volumeText;
  final double volumeLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SharedPaddings.left32,
          child: Text(volumeText),
        ),
        StatefulBuilder(
          builder: (context, setstate) {
            return Slider(
              value: volumeLevel,
              onChanged: (newValue) {
                setstate(() {});
              },
            );
          },
        ),
      ],
    );
  }
}
