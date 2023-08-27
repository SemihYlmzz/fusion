import 'package:flutter/material.dart';
import 'package:fusion/l10n/app_localizations.dart';
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
        AppLocalizations.of(context).termsOfUseInformation,
        style: const TextStyle(
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
