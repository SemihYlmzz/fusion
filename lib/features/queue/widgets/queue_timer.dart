import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_widgets/shared_widgets.dart';

class QueueTimer extends StatefulWidget {
  const QueueTimer({
    super.key,
  });

  @override
  State<QueueTimer> createState() => _QueueTimerState();
}

class _QueueTimerState extends State<QueueTimer> {
  late Timer _timer;
  int _counter = 0;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          _counter.toString().padLeft(2, '0'),
          style: GoogleFonts.bangers(
            fontSize: 68,
            fontWeight: FontWeight.w900,
            foreground: Paint()..style = PaintingStyle.stroke,
            shadows: [
              const Shadow(
                blurRadius: 24,
                color: Colors.white24,
              ),
            ],
          ),
        ),
        GradientTextButton(
          _counter.toString().padLeft(2, '0'),
          style: GoogleFonts.bangers(
            fontSize: 68,
          ),
        ),
      ],
    );
  }
}
