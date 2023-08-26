import 'package:flutter/material.dart';
import 'package:shared_widgets/shared_widgets.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const GradientButton(
      text: 'ACCEPT',
      width: 200,
    );
  }
}
