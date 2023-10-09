import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/gen/l10n/l10n.dart';

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
          L10n.current.settings,
          style: GoogleFonts.bangers(fontSize: 50),
        ),
      ),
    );
  }
}
