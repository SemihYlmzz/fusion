import 'package:fusion/repositories/device_prefs_repository/data/models/device_prefs_model.dart';

import '../../domain/entities/device_prefs.dart';

abstract class DevicePrefsDatasource {
  Future<DevicePrefsModel> createDevicePrefs();

  Future<DevicePrefsModel> readDevicePrefs();

  Future<DevicePrefsModel> updateDevicePrefs({
    required DevicePrefs updatedDevicePrefs,
  });
}
