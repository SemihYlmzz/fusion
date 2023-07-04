import 'package:flutter/material.dart';
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
        text: 'Sign In with Google',
        width: 320,
        onPressed: () {},
      ),
    );
  }
}
