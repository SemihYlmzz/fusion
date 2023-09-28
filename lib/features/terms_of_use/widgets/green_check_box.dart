import 'package:flutter/material.dart';
import 'package:fusion/core/typedefs/typedefs.dart';

class GreenCheckBox extends StatelessWidget {
  const GreenCheckBox({
    required this.isAccepted,
    required this.onAccept,
    super.key,
  });

  final bool isAccepted;
  final BoolCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2,
      child: Checkbox(
        value: isAccepted,
        shape: const CircleBorder(),
        onChanged: (val) {
          onAccept(value: val ?? false);
        },
      ),
    );
  }
}
