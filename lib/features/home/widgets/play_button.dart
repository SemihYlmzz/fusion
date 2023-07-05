import 'package:flutter/material.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const GradientButton(text: 'PLAY');
  }
}
