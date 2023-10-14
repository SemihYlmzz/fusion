import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpponentEscapeCountDown extends StatefulWidget {
  const OpponentEscapeCountDown({
    super.key,
  });

  @override
  State<OpponentEscapeCountDown> createState() => _OpponentEscapeCountDownState();
}

class _OpponentEscapeCountDownState extends State<OpponentEscapeCountDown> {
  late Timer _timer;
  // CLOUD FUNCTIONSDA LAST UPDATED DATETEN 30 SANİYE SONRAYI HESAPLAT
  int _counter = 30;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter--;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _counter.toString().padLeft(2, '0'),
      style: GoogleFonts.bangers(fontSize: 45, fontWeight: FontWeight.bold),
    );
  }
}
