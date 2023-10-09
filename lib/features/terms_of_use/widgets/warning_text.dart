import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../../app/gen/l10n/l10n.dart';

class WarningText extends StatelessWidget {
  const WarningText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.all8,
      child: Text(
        L10n.current.termsOfUseWarningText,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
