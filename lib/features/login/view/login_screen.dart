import 'package:flutter/material.dart';

import 'package:fusion/features/login/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LoginView(),
      ),
    );
  }
}
