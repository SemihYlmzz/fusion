import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fusion/config/app_router.dart';
import 'package:fusion/config/style/theme.dart';
import 'package:fusion/injection_container.dart';
import 'package:fusion/l10n/l10n.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    final authBloc = getIt<AuthBloc>();
    final userBloc = getIt<UserBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => authBloc),
        BlocProvider<UserBloc>(create: (_) => userBloc),
      ],
      child: MaterialApp.router(
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        routerConfig: router,
        builder: (_, router) {
          return MultiBlocListener(
            listeners: [
              _buildAuthBlocListener(userBloc),
              _buildUserBlocListener(),
            ],
            child: router!,
          );
        },
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }

  BlocListener<AuthBloc, AuthState> _buildAuthBlocListener(UserBloc userBloc) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          _showSnackBar(context, state.errorMessage!);
        } else if (state is AuthAuthenticated) {
          userBloc.add(UserReadWithUidRequested(state.authEntity.id));
        }
      },
    );
  }

  BlocListener<UserBloc, UserState> _buildUserBlocListener() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          _showSnackBar(context, state.errorMessage!);
        }
      },
    );
  }

  void _showSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
  }
}
