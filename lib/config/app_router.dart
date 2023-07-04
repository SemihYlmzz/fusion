import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/home/view/home_screen.dart';
import 'package:fusion/features/login/login.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter();

  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ],
    redirect: (context, state) {
      final authBloc = context.watch<AuthBloc>();

      final authState = authBloc.state;

      if (authState is AuthLoading) {
        return null;
      } else if (authState is AuthAuthenticated) {
        return '/home';
      } else {
        return '/';
      }
    },
  );
}
