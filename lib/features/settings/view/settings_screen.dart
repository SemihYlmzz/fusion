import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/home/home.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String path = 'settings';
  static const String name = 'settings';

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: () {
            context.go(HomeScreen.path);
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  const AuthLogoutRequested(),
                );
          },
          child: Text(AppLocalizations.of(context).signOut),
        ),
      ),
    );
  }
}
