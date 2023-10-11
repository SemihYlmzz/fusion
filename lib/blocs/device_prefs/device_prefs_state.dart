part of 'device_prefs_bloc.dart';

abstract class DevicePrefsState extends Equatable {
  const DevicePrefsState({
    this.errorMessage,
    this.devicePrefs = DevicePrefsModel.empty,
  });
  final String? errorMessage;
  final DevicePrefsModel devicePrefs;
  @override
  List<Object?> get props => [errorMessage];
}

class DevicePrefsInitialized extends DevicePrefsState {
  const DevicePrefsInitialized();
}

class DevicePrefsLoading extends DevicePrefsState {
  const DevicePrefsLoading({super.devicePrefs});
}

class DevicePrefsReaded extends DevicePrefsState {
  const DevicePrefsReaded({required super.devicePrefs});
}

class DevicePrefsHasError extends DevicePrefsState {
  const DevicePrefsHasError({
    required super.errorMessage,
    required this.errorCleanType,
    required this.errorDisplayType,
    super.devicePrefs,
  });
  final ErrorCleanType errorCleanType;
  final ErrorDisplayType errorDisplayType;
}

class DevicePrefsUnreaded extends DevicePrefsState {
  const DevicePrefsUnreaded();
}
