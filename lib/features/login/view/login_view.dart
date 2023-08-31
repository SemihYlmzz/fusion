import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/shared/text/gradient_fusion_text.dart';
import 'package:fusion/features/login/widgets/sign_in_with_apple_button.dart';
import 'package:fusion/features/login/widgets/sign_in_with_facebook_button.dart';
import 'package:fusion/features/login/widgets/sign_in_with_google_button.dart';
import 'package:fusion/features/login/widgets/welcome_divider.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../audio/audio_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AudioCubit>().stopBackgroundMusic();
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
