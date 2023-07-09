import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/config/app_router_refresh_stream.dart';
import 'package:fusion/features/app/view/app.dart';
import 'package:fusion/features/home/view/home_screen.dart';
import 'package:fusion/features/login/login.dart';
import 'package:fusion/injection_container.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/settings/settings.dart';

mixin RouterMixin on State<App> {
  final _router = GoRouter(
    initialLocation: LoginScreen.path,
    routes: [
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomeScreen(),
        ),
        routes: [
          GoRoute(
            path: SettingsScreen.path,
            name: SettingsScreen.name,
            builder: (context, state) {
              return const SettingsScreen();
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final onLoginScreen = state.matchedLocation == LoginScreen.path;

      final authState = context.read<AuthBloc>().state;
      if (authState is AuthUnAuthenticated) {
        return LoginScreen.path;
      }
      if (authState is AuthAuthenticated && onLoginScreen) {
        return HomeScreen.path;
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(getIt<AuthBloc>().stream),
  );

  GoRouter get router => _router;
}
