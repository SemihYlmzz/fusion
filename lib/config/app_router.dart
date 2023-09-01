import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/config/app_router_refresh_stream.dart';
import 'package:fusion/features/app/view/app.dart';
import 'package:fusion/features/delete_account/view/delete_account_screen.dart';
import 'package:fusion/features/home/view/home_screen.dart';
import 'package:fusion/features/login/login.dart';
import 'package:fusion/features/queue/view/queue_screen.dart';
import 'package:fusion/features/terms_of_use/view/terms_of_use_screen.dart';
import 'package:fusion/injection_container.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

mixin RouterMixin on State<App> {
  final _router = GoRouter(
    initialLocation: TermsOfUseScreen.path,
    routes: [
      GoRoute(
        path: TermsOfUseScreen.path,
        name: TermsOfUseScreen.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TermsOfUseScreen(),
        ),
      ),
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
      ),
      GoRoute(
        path: DeleteAccountScreen.path,
        name: DeleteAccountScreen.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: DeleteAccountScreen(),
        ),
      ),
      GoRoute(
        path: QueueScreen.path,
        name: QueueScreen.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: QueueScreen(),
        ),
      ),
    ],
    redirect: (context, state) async {
      final onLoginScreen = state.matchedLocation == LoginScreen.path;
      final onTermsScreen = state.matchedLocation == TermsOfUseScreen.path;

      final authState = context.read<AuthBloc>().state;

      if (authState is AuthUnAuthenticated && !onTermsScreen) {
        return LoginScreen.path;
      }

      if (authState is AuthAuthenticated && onLoginScreen) {
        return HomeScreen.path;
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      getIt<AuthBloc>().stream,
    ),
  );

  GoRouter get router => _router;
}
