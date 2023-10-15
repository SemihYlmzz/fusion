import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_widgets/shared_widgets.dart';

class GradientFusionText extends StatelessWidget {
  const GradientFusionText({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientTextButton(
      'FUSION',
      style: GoogleFonts.bangers(
        fontSize: 120,
      ),
    );
  }
}
