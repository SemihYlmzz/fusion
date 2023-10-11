import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/login/login.dart';
import 'package:go_router/go_router.dart';

import '../../../../blocs/blocs.dart';
import 'view.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});
  static const String path = '/terms_of_use';
  static const String name = 'terms_of_use';

  @override
  Widget build(BuildContext context) {
    
    final isTermsAndConditionsAccepted = context.select(
      (DevicePrefsBloc devicePrefsBloc) =>
          devicePrefsBloc.state.devicePrefs.isTermsAndConditionsAccepted,
    );

    if (isTermsAndConditionsAccepted) {
      context.goNamed(LoginScreen.name);
    }

    return const TermsOfUseView();
  }
}
