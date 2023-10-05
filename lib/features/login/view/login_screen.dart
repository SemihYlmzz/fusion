import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../repositories/auth_repository/bloc/auth_bloc.dart';
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

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BaseScaffold(
          body: (authState is AuthUnAuthenticated || authState is AuthLoading)
              ? LoadingScreen(
                  size: MediaQuery.of(context).size,
                  isLoading: authState is AuthLoading,
                  child: const LoginView(),
                )
              : const AuthOutStateView(),
        );
      },
    );
  }
}
