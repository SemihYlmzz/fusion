import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import 'settings_thick_button.dart';

class ShowCreditsButton extends StatelessWidget {
  const ShowCreditsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsThickButton(
      buttonText: AppLocalizations.of(context).credits,
    );
  }
}
