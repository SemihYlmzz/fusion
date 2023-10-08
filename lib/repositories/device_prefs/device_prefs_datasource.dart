import 'models/device_prefs_model.dart';

abstract class DevicePrefsDatasource {
  Future<DevicePrefsModel> createDevicePrefs();

  Future<DevicePrefsModel> readDevicePrefs();

  Future<DevicePrefsModel> updateDevicePrefs({
    required DevicePrefsModel updatedDevicePrefs,
  });
}
