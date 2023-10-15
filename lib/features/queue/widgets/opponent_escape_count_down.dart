import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/blocs/game/game_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_widgets/shared_widgets.dart';

class OpponentEscapeCountDown extends StatefulWidget {
  const OpponentEscapeCountDown({
    super.key,
  });

  @override
  State<OpponentEscapeCountDown> createState() =>
      _OpponentEscapeCountDownState();
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
      if (_counter == 0) {
        context.read<GameBloc>().add(const OpponentEscapedWinRequested());
        _timer.cancel();
      }
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
