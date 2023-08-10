import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_constants/shared_constants.dart';

class SettingsThickButton extends StatelessWidget {
  const SettingsThickButton({
    required this.buttonText,
    super.key,
  });
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical4,
      child: Padding(
        padding: SharedPaddings.horizontal32,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            border: GradientBoxBorder(
              gradient: LinearGradient(
                colors: [
                  Colors.orange.withOpacity(0.65),
                  Colors.pink.withOpacity(0.65),
                ],
              ),
            ),
          ),
          height: 40,
          width: 320,
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.bangers(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
