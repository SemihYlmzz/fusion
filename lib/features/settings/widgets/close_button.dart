import 'package:flutter/material.dart';

import '../../../config/style/colors.dart';

class SettingsCloseButton extends StatelessWidget {
  const SettingsCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [AppColors.orange, AppColors.pink],
        ),
      ),
      child: const Icon(
        Icons.clear,
        size: 34,
      ),
    );
  }
}
