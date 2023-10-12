import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/cubits/cubits.dart';
import '../../../blocs/blocs.dart';
import '../login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String path = '/login';
  static const String name = 'login';

  @override
  Widget build(BuildContext context) {
    // To make status bar white
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );
    context.read<AudioCubit>().stopBackgroundMusic();
    context.read<UserBloc>().add(const ClearUserRequested());

    return const BaseScaffold(
      body: LoginView(),
    );
  }
}
