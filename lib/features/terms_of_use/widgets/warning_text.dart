import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../../app/l10n/l10n.dart';

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
