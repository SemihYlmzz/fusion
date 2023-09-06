import 'package:flutter/material.dart';
import 'package:fusion/l10n/l10n.dart';
import 'package:shared_constants/shared_constants.dart';

class WarningText extends StatelessWidget {
  const WarningText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.all8,
      child: Text(
        context.l10n.termsOfUseWarningText,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
