import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  factory SettingsScreen.routeBuilder(_, __) {
    return const SettingsScreen(
      key: Key('settings'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthBloc>().add(
                const AuthLogoutRequested(),
              );
        },
        child: Text(AppLocalizations.of(context).signOut),
      ),
    );
  }
}
