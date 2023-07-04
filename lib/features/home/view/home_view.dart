import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseColumn(
      children: [
        ElevatedButton(
          child: const Text('Sign Out'),
          onPressed: () {
            context.read<AuthBloc>().add(const AuthLogoutRequested());
          },
        ),
      ],
    );
  }
}
