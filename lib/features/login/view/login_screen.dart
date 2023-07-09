import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fusion/features/login/login.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  factory LoginScreen.routeBuilder(_,__) {
    return const LoginScreen(
      key: Key('login'),
    );
  }
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
        if (authState is AuthUnAuthenticated || authState is AuthLoading) {
          return BaseScaffold(
            body: LoadingScreen(
              size: MediaQuery.of(context).size,
              isLoading: authState is AuthLoading,
              child: const LoginView(),
            ),
          );
        }
        return const AuthOutStateView();
      },
    );
  }
}
