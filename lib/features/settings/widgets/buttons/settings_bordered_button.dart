import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../../gen/assets.gen.dart';

class SettingsBorderedButton extends StatelessWidget {
  const SettingsBorderedButton({
    required this.buttonText,
    required this.buttonWidget,
    this.onTap,
    super.key,
  });
  final String buttonText;
  final Widget buttonWidget;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: GestureDetector(
        onTap: onTap,
        child: ColoredBox(
          color: Colors.transparent,
          child: Column(
            children: [
              Image.asset(
                Assets.images.borders.settingsBorderTop.path,
              ),
              Padding(
                padding: SharedPaddings.horizontal16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      buttonText,
                      style: GoogleFonts.bangers(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 44,
                      child: Center(child: buttonWidget),
                    ),
                  ],
                ),
              ),
              Image.asset(
                Assets.images.borders.settingsBorderBottom.path,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
