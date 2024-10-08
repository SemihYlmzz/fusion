import 'package:flutter/material.dart';

import '../../../../app/theme/colors.dart';

class SettingsCloseButton extends StatelessWidget {
  const SettingsCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
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
      ),
    );
  }
}
