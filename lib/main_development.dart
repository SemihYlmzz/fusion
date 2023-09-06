import 'dart:async';

import 'features/app/view/app.dart';
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
