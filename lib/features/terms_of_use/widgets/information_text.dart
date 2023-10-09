import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../../app/gen/l10n/l10n.dart';

class InformationText extends StatelessWidget {
  const InformationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: Text(
        L10n.current.termsOfUseInformation,
        style: const TextStyle(
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
