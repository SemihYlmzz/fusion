import 'package:flutter/material.dart';
import 'package:fusion/utils/typedefs.dart';

class GreenCheckBox extends StatelessWidget {
  const GreenCheckBox({
    super.key,
    required this.isAccepted,
    required this.onAccept,
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
