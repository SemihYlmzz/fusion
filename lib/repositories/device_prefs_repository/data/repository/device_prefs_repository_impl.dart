import '../datasource/device_prefs_datasource.dart';
import '../../domain/entities/device_prefs.dart';
import '../../domain/repository/device_prefs_repository.dart';
import '../../../../utils/typedefs.dart';

class DevicePrefsRepositoryImpl implements DevicePrefsRepository {
  DevicePrefsRepositoryImpl(
    DevicePrefsDatasource devicePrefsDatasource,
  ) : _devicePrefsDatasource = devicePrefsDatasource;
  final DevicePrefsDatasource _devicePrefsDatasource;

  @override
  FutureEither<DevicePrefs> createDevicePrefs() {
    return _devicePrefsDatasource.createDevicePrefs();
  }

  @override
  FutureEither<DevicePrefs> readDevicePrefs() {
    return _devicePrefsDatasource.readDevicePrefs();
  }

  @override
  FutureEither<DevicePrefs> updateDevicePrefs({
    required DevicePrefs updatedDevicePrefs,
  }) {
    return _devicePrefsDatasource.updateDevicePrefs(
      updatedDevicePrefs: updatedDevicePrefs,
    );
  }
}
