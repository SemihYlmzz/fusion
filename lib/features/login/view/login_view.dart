import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_widgets/shared_widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseColumn(
      children: [
        Text(
          'FUSION',
          style: GoogleFonts.bangers(
            fontSize: 120,
          ),
        ),
      ],
    );
  }
}
