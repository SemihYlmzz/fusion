import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '/../blocs/blocs.dart';
import '../../../app/gen/l10n/l10n.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: SocialLoginButton(
        buttonType: SocialLoginButtonType.google,
        text: L10n.current.signInWithGoogle,
        width: 320,
        onPressed: () {
          context.read<AuthBloc>().add(const LogInWithGoogleRequested());
        },
      ),
    );
  }
}
