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

class DevicePrefsUnreaded extends DevicePrefsState {
  const DevicePrefsUnreaded({super.devicePrefs, super.errorMessage});
}

class DevicePrefsReaded extends DevicePrefsState {
  const DevicePrefsReaded({required super.devicePrefs, super.errorMessage});
}
