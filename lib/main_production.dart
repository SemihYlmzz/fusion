import 'dart:async';

import 'features/app/view/app.dart';
import 'initialize/bootstrap.dart';

void main() async {
  const flavorProduction = 'production';

  unawaited(
    bootstrap(
      const App(
        flavor: flavorProduction,
      ),
    ),
  );
}
