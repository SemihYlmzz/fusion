import 'package:flutter/material.dart';
import 'package:fusion/features/login/login.dart';
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
    ],
  );
}
