import 'package:flutter/material.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/widgets/text/gradient_fusion_text.dart';
import '../widgets/sign_in_with_apple_button.dart';
import '../widgets/sign_in_with_facebook_button.dart';
import '../widgets/sign_in_with_google_button.dart';
import '../widgets/welcome_divider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseColumn(
      children: [
        GradientFusionText(),
        WelcomeDivider(),
        Column(
          children: [
            SignInWithFacebookButton(),
            SignInWithAppleButton(),
            SignInWithGoogleButton(),
          ],
        ),
      ],
    );
  }
}
