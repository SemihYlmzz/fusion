import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/device_prefs/models/device_prefs_model.dart';

import '../../../core/errors/failure/failure.dart';
import '../../../core/typedefs/typedefs.dart';
import '../delete_request/errors/errors.dart';
import 'device_prefs_datasource.dart';
import 'errors/errors.dart';

class DevicePrefsRepository {
  DevicePrefsRepository(
    DevicePrefsDatasource devicePrefsDatasource,
  ) : _devicePrefsDatasource = devicePrefsDatasource;
  final DevicePrefsDatasource _devicePrefsDatasource;

  FutureEither<DevicePrefsModel> createDevicePrefs() async {
    try {
      final devicePrefsModel = await _devicePrefsDatasource.createDevicePrefs();
      return Right(devicePrefsModel);
    } on CreateDeleteRequestExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  FutureEither<DevicePrefsModel> readDevicePrefs() async {
    try {
      final devicePrefsModel = await _devicePrefsDatasource.readDevicePrefs();
      return Right(devicePrefsModel);
    } on ReadDevicePrefsExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  FutureEither<DevicePrefsModel> updateDevicePrefs({
    required DevicePrefsModel updatedDevicePrefs,
  }) async {
    try {
      final devicePrefsModel = await _devicePrefsDatasource.updateDevicePrefs(
        updatedDevicePrefs: updatedDevicePrefs,
      );
      return Right(devicePrefsModel);
    } on UpdateDevicePrefsExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
