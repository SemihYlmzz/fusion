import 'dart:async';

import 'app/app.dart';
import 'initialize/bootstrap.dart';

void main() async {
  const flavorStaging = 'staging';

  unawaited(
    bootstrap(
      const App(
        flavor: flavorStaging,
      ),
    ),
  );
}
