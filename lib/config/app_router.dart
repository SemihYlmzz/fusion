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
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'settings',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: SettingsScreen.routeBuilder(context, state),
              );
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final onLoginScreen = state.matchedLocation == '/';

      final authState = context.read<AuthBloc>().state;
      if (authState is AuthUnAuthenticated) {
        return '/';
      }
      if (authState is AuthAuthenticated && onLoginScreen) {
        return '/home';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(getIt<AuthBloc>().stream),
  );

  GoRouter get router => _router;
}
