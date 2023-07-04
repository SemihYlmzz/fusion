import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignInWithAppleButton extends StatelessWidget {
  const SignInWithAppleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: SocialLoginButton(
        buttonType: SocialLoginButtonType.apple,
        text: 'Sign In with Apple',
        width: 320,
        onPressed: () {},
      ),
    );
  }
}
