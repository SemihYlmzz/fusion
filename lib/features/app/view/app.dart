import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Text(
            'FUSION',
            style: GoogleFonts.bangers(
              fontSize: 120,
            ),
          ),
        ),
      ),
    );
  }
}
