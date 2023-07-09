import 'package:flutter/material.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../l10n/app_localizations.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      text: AppLocalizations.of(context).play,
      onPressed: () {},
    );
  }
}
