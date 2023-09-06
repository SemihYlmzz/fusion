import '../../initialize/injection_container.dart';
import 'data/datasource/device_prefs_datasource.dart';
import 'data/datasource/device_prefs_datasource_shared_preferences_impl.dart';
import 'data/repository/device_prefs_repository_impl.dart';
import 'domain/repository/device_prefs_repository.dart';
import 'domain/usecase/usecases/create_device_prefs.dart';
import 'domain/usecase/usecases/read_device_prefs.dart';
import 'domain/usecase/usecases/update_device_prefs.dart';

class DevicePrefsRepositoryInjection {
  static Future<void> inject() async {
    // UserDataSource <-connection-> Firebase
    getIt
      ..registerSingleton<DevicePrefsDatasource>(
        DevicePrefsDataSourceSharedPreferencesImpl(),
      )
      ..registerSingleton<DevicePrefsRepository>(
        DevicePrefsRepositoryImpl(getIt()),
      )
      ..registerSingleton<CreateDevicePrefsUseCase>(
        CreateDevicePrefsUseCase(
          devicePrefsRepository: getIt<DevicePrefsRepository>(),
        ),
      )
      ..registerSingleton<ReadDevicePrefsUseCase>(
        ReadDevicePrefsUseCase(
          devicePrefsRepository: getIt<DevicePrefsRepository>(),
        ),
      )
      ..registerSingleton<UpdateDevicePrefsUseCase>(
        UpdateDevicePrefsUseCase(
          devicePrefsRepository: getIt<DevicePrefsRepository>(),
        ),
      );
  }
}
