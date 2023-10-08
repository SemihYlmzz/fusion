import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure/failure.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../../delete/data/errors/errors.dart';
import '../../domain/entities/device_prefs.dart';
import '../../domain/repository/device_prefs_repository.dart';
import '../datasource/device_prefs_datasource.dart';
import '../errors/errors.dart';

class DevicePrefsRepositoryImpl implements DevicePrefsRepository {
  DevicePrefsRepositoryImpl(
    DevicePrefsDatasource devicePrefsDatasource,
  ) : _devicePrefsDatasource = devicePrefsDatasource;
  final DevicePrefsDatasource _devicePrefsDatasource;

  @override
  FutureEither<DevicePrefs> createDevicePrefs() async {
    try {
      final devicePrefsModel = await _devicePrefsDatasource.createDevicePrefs();
      return Right(devicePrefsModel);
    } on CreateDeleteRequestExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  FutureEither<DevicePrefs> readDevicePrefs() async {
    try {
      final devicePrefsModel = await _devicePrefsDatasource.readDevicePrefs();
      return Right(devicePrefsModel);
    } on ReadDevicePrefsExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  FutureEither<DevicePrefs> updateDevicePrefs({
    required DevicePrefs updatedDevicePrefs,
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
