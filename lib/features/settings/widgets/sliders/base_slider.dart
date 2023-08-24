import 'package:flutter/material.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:shared_constants/shared_constants.dart';

class BaseSlider extends StatelessWidget {
  const BaseSlider({
    required this.volumeText,
    required this.volumeLevel,
    super.key,
    this.onChangeStart,
    this.onChanged,
    this.onChangeEnd,
  });

  final String volumeText;
  final double volumeLevel;
  final DoubleCallback? onChangeStart;
  final DoubleCallback? onChanged;
  final DoubleCallback? onChangeEnd;

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
          onChangeStart: (newValue) {
            onChangeStart?.call(newValue);
          },
          onChanged: (newValue) {
            onChanged?.call(newValue);
          },
          onChangeEnd: (newValue) {
            onChangeEnd?.call(newValue);
          },
        ),
      ],
    );
  }
}
