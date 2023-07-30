import 'package:flutter/material.dart';
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
          'SETTINGS',
          style: GoogleFonts.bangers(fontSize: 50),
        ),
      ),
    );
  }
}
