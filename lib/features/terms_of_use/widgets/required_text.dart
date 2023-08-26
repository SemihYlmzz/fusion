import 'package:flutter/material.dart';

class RequiredText extends StatelessWidget {
  const RequiredText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'This is required to play.',
      style: TextStyle(
        color: Colors.white54,
      ),
    );
  }
}
