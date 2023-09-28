import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/device_prefs.dart';

abstract class DevicePrefsDatasource {
  FutureEither<DevicePrefs> createDevicePrefs();

  FutureEither<DevicePrefs> readDevicePrefs();

  FutureEither<DevicePrefs> updateDevicePrefs({
    required DevicePrefs updatedDevicePrefs,
  });
}
