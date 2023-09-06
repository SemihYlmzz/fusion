import '../../../../utils/typedefs.dart';
import '../entities/device_prefs.dart';

abstract class DevicePrefsRepository {
  FutureEither<DevicePrefs> createDevicePrefs();

  FutureEither<DevicePrefs> readDevicePrefs();

  FutureEither<DevicePrefs> updateDevicePrefs({
    required DevicePrefs updatedDevicePrefs,
  });
}
