import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import 'settings_bordered_button.dart';

class UsernameChanger extends StatelessWidget {
  const UsernameChanger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsBorderedButton(
      buttonText: AppLocalizations.of(context).username,
      buttonWidget: const Text('CL4Y'),
    );
  }
}
