import 'package:flutter/material.dart';
import 'package:fusion/config/app_router.dart';
import 'package:fusion/config/style/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
