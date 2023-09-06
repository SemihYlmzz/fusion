import 'package:flutter/material.dart';
import 'package:fusion/l10n/l10n.dart';
import 'package:shared_constants/shared_constants.dart';

class InformationText extends StatelessWidget {
  const InformationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: Text(
        context.l10n.termsOfUseInformation,
        style: const TextStyle(
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
