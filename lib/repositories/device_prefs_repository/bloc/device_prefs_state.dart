part of 'device_prefs_bloc.dart';

abstract class DevicePrefsState extends Equatable {
  const DevicePrefsState({
    this.errorMessage,
    this.devicePrefs = DevicePrefs.empty,
  });
  final String? errorMessage;
  final DevicePrefs devicePrefs;
  @override
  List<Object?> get props => [errorMessage];
}

class DevicePrefsInitialized extends DevicePrefsState {
  const DevicePrefsInitialized();
}

class DevicePrefsReaded extends DevicePrefsState {
  const DevicePrefsReaded({required super.devicePrefs});
}

class DevicePrefsHasError extends DevicePrefsState {
  const DevicePrefsHasError({required super.errorMessage,super.devicePrefs});
}

class DevicePrefsUnreaded extends DevicePrefsState {
  const DevicePrefsUnreaded();
}
