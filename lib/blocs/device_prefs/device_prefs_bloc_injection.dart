import 'package:fusion/repositories/device_prefs/device_prefs.dart';

import '../../../initialize/injection_container.dart';

import 'device_prefs_bloc.dart';

class DevicePrefsBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerSingleton<DevicePrefsBloc>(
      DevicePrefsBloc(
        devicePrefsRepository: getIt<DevicePrefsRepository>(),
      ),
    );
  }
}
