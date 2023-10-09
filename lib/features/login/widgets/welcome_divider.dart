import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/gen/l10n/l10n.dart';

class WelcomeDivider extends StatelessWidget {
  const WelcomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            indent: 16,
            color: Colors.white,
            endIndent: 32,
          ),
        ),
        Text(
          L10n.current.welcome,
          style: GoogleFonts.abel(fontSize: 22),
        ),
        const Expanded(
          child: Divider(
            indent: 32,
            color: Colors.white,
            endIndent: 16,
          ),
        ),
      ],
    );
  }
}
