import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';

class InformationText extends StatelessWidget {
  const InformationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: SharedPaddings.vertical8,
      child: Text(
        'To continue to the game,\nplease read and confirm the following:',
        style: TextStyle(
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
