import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fusion/config/style/colors.dart';
import 'package:fusion/gen/assets.gen.dart';
import 'package:fusion/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../widgets/widgets.dart';

class TermsOfUseView extends StatefulWidget {
  const TermsOfUseView({
    super.key,
  });

  @override
  State<TermsOfUseView> createState() => _TermsOfUseViewState();
}

class _TermsOfUseViewState extends State<TermsOfUseView> {
  bool isPrivacyAccepted = false;
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.splash.fusionSplashImage.path),
            fit: BoxFit.none,
          ),
        ),
        child: BaseColumn(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Animate(
              effects: const [
                FadeEffect(
                  duration: SharedDurations.ms500,
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.orange,
                        AppColors.pink,
                      ],
                    ),
                  ),
                  borderRadius: SharedBorderRadius.circular12,
                ),
                width: 320,
                child: Padding(
                  padding: SharedPaddings.all20,
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context).welcome,
                        style: GoogleFonts.bangers(fontSize: 40),
                      ),
                      const InformationText(),
                      PrivacyAcceptButton(
                        isAcceptedPrivacy: isPrivacyAccepted,
                        onAccept: ({bool? value}) {
                          isPrivacyAccepted = value ?? false;
                          setState(() {});
                        },
                      ),
                      TermsAcceptButton(
                        isAcceptedTerms: isTermsAccepted,
                        onAccept: ({bool? value}) {
                          isTermsAccepted = value ?? false;
                          setState(() {});
                        },
                      ),
                      const WarningText(),
                      SaveAcceptenceButton(
                        isReadyToAccept: isTermsAccepted && isPrivacyAccepted,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
