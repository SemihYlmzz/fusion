// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/home/view/home_view.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../injection_container.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  factory HomeScreen.routeBuilder(_) {
    return const HomeScreen(
      key: Key('login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
              ),
            );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return BlocProvider<UserBloc>(
            create: (_) => getIt<UserBloc>()
              ..add(UserReadWithUidRequested(authState.authEntity.id)),
            child: BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage!),
                      ),
                    );
                }
              },
              child: LoadingScreen(
                isLoading: authState is AuthLoading,
                size: size,
                child: BaseScaffold(
                  safeArea: true,
                  body: Padding(
                    padding: const EdgeInsets.all(8),
                    child: HomeView(
                      uid: authState.authEntity.id,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
