import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignInWithFacebookButton extends StatelessWidget {
  const SignInWithFacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: SocialLoginButton(
        buttonType: SocialLoginButtonType.facebook,
        text: 'Sign In with Facebook',
        width: 320,
        onPressed: () {},
      ),
    );
  }
}
