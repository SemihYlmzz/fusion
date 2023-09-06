import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../l10n/app_localizations.dart';

class WarningText extends StatelessWidget {
  const WarningText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.all8,
      child: Text(
        AppLocalizations.of(context).termsOfUseWarningText,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
