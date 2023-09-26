import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/app/view/app.dart';
import '../features/delete_account/view/delete_account_screen.dart';
import '../features/game/view/game_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/login/login.dart';
import '../features/preload/view/preload_screen.dart';
import '../features/queue/view/queue_screen.dart';
import '../features/terms_of_use/view/terms_of_use_screen.dart';
import '../initialize/injection_container.dart';
import '../repositories/auth_repository/bloc/auth_bloc.dart';
import 'app_router_refresh_stream.dart';

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
        path: PreloadScreen.path,
        name: PreloadScreen.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: PreloadScreen(),
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
      GoRoute(
        path: GameScreen.path,
        name: GameScreen.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: GameScreen(),
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
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(
      getIt<AuthBloc>().stream,
    ),
  );

  GoRouter get router => _router;
}
