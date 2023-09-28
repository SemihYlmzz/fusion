import 'dart:async';

import 'app/app.dart';
import 'initialize/bootstrap.dart';

void main() async {
  const flavorDevelopment = 'development';

  unawaited(
    bootstrap(
      const App(
        flavor: flavorDevelopment,
      ),
    ),
  );
}
