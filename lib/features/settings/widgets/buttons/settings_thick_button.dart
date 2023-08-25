import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_constants/shared_constants.dart';

class SettingsThickButton extends StatelessWidget {
  const SettingsThickButton({
    required this.buttonText,
    this.onTap,
    super.key,
  });
  final String buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical4,
      child: Padding(
        padding: SharedPaddings.horizontal32,
        child: GestureDetector(
          onTap: () => onTap?.call(),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white12,
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [
                    Colors.white24,
                    Colors.white24,
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
      ),
    );
  }
}
