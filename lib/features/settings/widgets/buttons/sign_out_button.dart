import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/../blocs/blocs.dart';
import '../../../../app/gen/l10n/l10n.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        context.read<AuthBloc>().add(const AuthLogoutRequested());
      },
      child: Text(
        L10n.current.signOut,
      ),
    );
  }
}
