import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/login/view/view.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:go_router/go_router.dart';

import 'view.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});
  static const String path = '/terms_of_use';
  static const String name = 'terms_of_use';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, devicePrefsState) {
        if (devicePrefsState.devicePrefs.isTermsAndConditionsAccepted) {
          context.goNamed(LoginScreen.name);
        }
        return const TermsOfUseView();
      },
    );
  }
}
