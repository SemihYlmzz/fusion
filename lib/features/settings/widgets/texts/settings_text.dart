import 'package:flutter/material.dart';
import 'package:fusion/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';


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
          context.l10n.settings,
          style: GoogleFonts.bangers(fontSize: 50),
        ),
      ),
    );
  }
}
