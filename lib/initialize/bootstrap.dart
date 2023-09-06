import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'app_initializer.dart';

Future<void> bootstrap(Widget app) async {
  // Logging Flutter errors
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  //  Run Zoned Guarded logs Errors and Stack Trace
  await runZonedGuarded(
    () async {
      // Initializings
      WidgetsFlutterBinding.ensureInitialized();
      await AppInitializer.initialize();

      // Run App Function
      runApp(app);
    },

    //  Run Zoned Guarded - Errors and Stack Trace
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
