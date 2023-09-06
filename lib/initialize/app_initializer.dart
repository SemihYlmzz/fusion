import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';

import 'app_bloc_observer.dart';
import 'injection_container.dart';

abstract final class AppInitializer {
  static Future<void> initialize() async {
    
    // Configure Logger
    if (kReleaseMode) {
      Logger.root.level = Level.WARNING;
    }
    // Print Logger Activities
    Logger.root.onRecord.listen((record) {
      debugPrint('LOGGER ${record.level.name}: ${record.time}: '
          '${record.loggerName}: '
          '${record.message}');
    });

    // Initialize Bloc Observer
    Bloc.observer = AppBlocObserver();

    // Initialize Screen Orientation Configs
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    // Initialize Firebase
    await Firebase.initializeApp();
    // Initialize Mobile Ads
    await MobileAds.instance.initialize();
    // Initialize Blocs & Repositories
    await InjectionContainer.initializeDependencies();

  }
}
