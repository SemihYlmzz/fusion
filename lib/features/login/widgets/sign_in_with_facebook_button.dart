import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../../app/l10n/l10n.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';

class SignInWithFacebookButton extends StatelessWidget {
  const SignInWithFacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: SharedPaddings.vertical8,
            child: SocialLoginButton(
              buttonType: SocialLoginButtonType.facebook,
              text: context.l10n.signInWithFacebook,
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
