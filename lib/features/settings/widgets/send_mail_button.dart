import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import 'settings_thick_button.dart';

class SendMailButton extends StatelessWidget {
  const SendMailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsThickButton(
      buttonText: AppLocalizations.of(context).sendUsAMail,
    );
  }
}
