part of 'device_prefs_bloc.dart';

abstract class DevicePrefsState extends Equatable {
  const DevicePrefsState({
    this.errorMessage,
    this.devicePrefs = DevicePrefsModel.empty,
  });
  final String? errorMessage;
  final DevicePrefsModel devicePrefs;
  
  DevicePrefsState copyWith({
    String? errorMessage,
    DevicePrefsModel? devicePrefs,
  });

  @override
  List<Object?> get props => [errorMessage, devicePrefs];
}

class DevicePrefsInitialized extends DevicePrefsState {
  const DevicePrefsInitialized();

  @override
  DevicePrefsState copyWith({
    String? errorMessage,
    DevicePrefsModel? devicePrefs,
  }) {
    return const DevicePrefsInitialized();
  }
}

class DevicePrefsLoading extends DevicePrefsState {
  const DevicePrefsLoading({super.devicePrefs});
  @override
  DevicePrefsState copyWith({
    String? errorMessage,
    DevicePrefsModel? devicePrefs,
  }) {
    return DevicePrefsLoading(
      devicePrefs: devicePrefs ?? this.devicePrefs,
    );
  }
}

class DevicePrefsReaded extends DevicePrefsState {
  const DevicePrefsReaded({required super.devicePrefs});
  @override
  DevicePrefsState copyWith({
    String? errorMessage,
    DevicePrefsModel? devicePrefs,
  }) {
    return DevicePrefsReaded(devicePrefs: devicePrefs ?? this.devicePrefs);
  }
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

  @override
  DevicePrefsState copyWith({
    String? errorMessage,
    ErrorCleanType? errorCleanType,
    ErrorDisplayType? errorDisplayType,
    DevicePrefsModel? devicePrefs,
  }) {
    return DevicePrefsHasError(
      devicePrefs: devicePrefs ?? this.devicePrefs,
      errorCleanType: errorCleanType ?? this.errorCleanType,
      errorDisplayType: errorDisplayType ?? this.errorDisplayType,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class DevicePrefsUnreaded extends DevicePrefsState {
  const DevicePrefsUnreaded();
  @override
  DevicePrefsState copyWith({
    String? errorMessage,
    DevicePrefsModel? devicePrefs,
  }) {
    return const DevicePrefsUnreaded();
  }
}
