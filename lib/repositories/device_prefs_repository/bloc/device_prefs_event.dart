part of 'device_prefs_bloc.dart';

sealed class DevicePrefsEvent {
  const DevicePrefsEvent();
}

final class CreateDevicePrefs extends DevicePrefsEvent {
  const CreateDevicePrefs();
}

final class ReadDevicePrefs extends DevicePrefsEvent {
  const ReadDevicePrefs();
}

class UpdateDevicePrefs extends DevicePrefsEvent {
  const UpdateDevicePrefs(this.devicePrefs);
  final DevicePrefs devicePrefs;
}
