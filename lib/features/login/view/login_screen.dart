import 'package:flutter/material.dart';

import 'package:fusion/features/login/login.dart';
import 'package:shared_widgets/shared_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      body: LoginView(),
    );
  }
}
