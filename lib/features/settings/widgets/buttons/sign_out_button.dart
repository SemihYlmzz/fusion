import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../repositories/auth_repository/bloc/auth_bloc.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.popUntil(context, (route) => route.isFirst);

        context.read<AuthBloc>().add(
              const AuthLogoutRequested(),
            );
      },
      child: Text(
        AppLocalizations.of(context).signOut,
      ),
    );
  }
}
