import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '/../blocs/blocs.dart';
import '../../../app/gen/l10n/l10n.dart';

class SignInWithFacebookButton extends StatelessWidget {
  const SignInWithFacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: SharedPaddings.vertical8,
            child: SocialLoginButton(
              buttonType: SocialLoginButtonType.facebook,
              text: L10n.current.signInWithFacebook,
              width: 320,
              onPressed: () {
                context
                    .read<AuthBloc>()
                    .add(const LogInWithFacebookRequested());
              },
            ),
          )
        : const SizedBox();
  }
}
