import '../../initialize/injection_container.dart';
import 'device_prefs.dart';


class DevicePrefsRepositoryInjection {
  static Future<void> inject() async {
    // UserDataSource <-connection-> Firebase
    getIt
      ..registerSingleton<DevicePrefsDatasource>(
        DevicePrefsDataSourceSharedPreferencesImpl(),
      )
      ..registerSingleton<DevicePrefsRepository>(
        DevicePrefsRepository(getIt<DevicePrefsDatasource>()),
      );
  }
}
