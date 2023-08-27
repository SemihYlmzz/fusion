import 'package:flutter/material.dart';
import 'package:fusion/l10n/app_localizations.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

class TermsAcceptButton extends StatelessWidget {
  const TermsAcceptButton({
    required this.onAccept,
    required this.isAcceptedTerms,
    super.key,
  });
  final BoolCallback onAccept;
  final bool isAcceptedTerms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: Row(
        children: [
          Transform.scale(
            scale: 2,
            child: Checkbox(
              value: isAcceptedTerms,
              shape: const CircleBorder(),
              onChanged: (val) {
                onAccept(value: val ?? false);
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(AppLocalizations.of(context).iAgreeToThe),
                GradientTextButton(
                  AppLocalizations.of(context).termsOfService,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
