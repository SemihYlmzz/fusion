import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fusion/config/style/colors.dart';
import 'package:fusion/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../widgets/widgets.dart';

class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({
    super.key,
  });

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
                      const WelcomeText(),
                      const Padding(
                        padding: SharedPaddings.vertical8,
                        child: Text(
                          'To continue to the game, please read and confirm the following:',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // PrivacyAcceptenceButton(),
                      Padding(
                        padding: SharedPaddings.vertical8,
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 2,
                              child: Checkbox(
                                value: true,
                                shape: const CircleBorder(),
                                onChanged: (val) {},
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                children: [
                                  Text('I have read and agree to the'),
                                  Wrap(
                                    spacing: 8,
                                    children: [
                                      GradientTextButton(
                                        'Nuverse Privacy',
                                        maxLines: 2,
                                        align: TextAlign.center,
                                      ),
                                      Text('and'),
                                      GradientTextButton(
                                        'Second Dinner Privacy Notice',
                                        maxLines: 2,
                                        align: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // TermsAcceptenceButton(),
                      Padding(
                        padding: SharedPaddings.vertical8,
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 2,
                              child: Checkbox(
                                value: true,
                                shape: const CircleBorder(),
                                onChanged: (val) {},
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                children: [
                                  Text('I agree to the FUSION'),
                                  GradientTextButton(
                                    'Terms of Service',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // WarningText(),
                      const Padding(
                        padding: SharedPaddings.vertical8,
                        child: Text(
                          '   By continuing, I agree to the Terms of Service and acknowledge reading the Privacy Notices for Nuverse and Second Dinner.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const AcceptButton(),
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

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'WELCOME TO FUSION!',
      style: GoogleFonts.bangers(
        fontSize: 40,
      ),
    );
  }
}
