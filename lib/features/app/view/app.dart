import 'package:flutter/material.dart';
import 'package:fusion/config/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerConfig: AppRouter.router,
    );
  }
}
