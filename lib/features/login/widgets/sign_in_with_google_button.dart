import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: SocialLoginButton(
        buttonType: SocialLoginButtonType.google,
        text: AppLocalizations.of(context)?.signInWithGoogle,
        width: 320,
        onPressed: () {},
      ),
    );
  }
}
