import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../l10n/app_localizations.dart';

class SettingsText extends StatelessWidget {
  const SettingsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Center(
        child: Text(
          AppLocalizations.of(context).settings,
          style: GoogleFonts.bangers(fontSize: 50),
        ),
      ),
    );
  }
}
