part of 'device_prefs_bloc.dart';

sealed class DevicePrefsEvent {
  const DevicePrefsEvent({
    this.errorCleanType = ErrorCleanType.immediately,
    this.errorDisplayType = ErrorDisplayType.snackBar,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

final class CreateDevicePrefs extends DevicePrefsEvent {
  const CreateDevicePrefs({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

final class ReadDevicePrefs extends DevicePrefsEvent {
  const ReadDevicePrefs({
    super.errorCleanType,
    super.errorDisplayType,
  });
}

class UpdateDevicePrefs extends DevicePrefsEvent {
  const UpdateDevicePrefs({
    required this.devicePrefs,
    super.errorCleanType,
    super.errorDisplayType,
  });
  final DevicePrefsModel devicePrefs;
}

final class ClearDevicePrefsErrorMessage extends DevicePrefsEvent {
  const ClearDevicePrefsErrorMessage();
}
