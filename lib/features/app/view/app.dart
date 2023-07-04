import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fusion/config/app_router.dart';
import 'package:fusion/config/style/theme.dart';
import 'package:fusion/injection_container.dart';
import 'package:fusion/l10n/l10n.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
      ],
      child: MaterialApp.router(
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        routerConfig: AppRouter.router,
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
}
