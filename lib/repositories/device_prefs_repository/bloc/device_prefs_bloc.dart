import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../auth_repository/domain/usecase/params/no_params.dart';
import '../domain/entities/device_prefs.dart';
import '../domain/usecase/usecases/create_device_prefs.dart';
import '../domain/usecase/usecases/read_device_prefs.dart';
import '../domain/usecase/usecases/update_device_prefs.dart';

part 'device_prefs_event.dart';
part 'device_prefs_state.dart';

class DevicePrefsBloc extends Bloc<DevicePrefsEvent, DevicePrefsState> {
  DevicePrefsBloc({
    required this.createDevicePrefsUseCase,
    required this.readDevicePrefsUseCase,
    required this.updateDevicePrefsUseCase,
  }) : super(const DevicePrefsUnreaded()) {
    on<CreateDevicePrefs>(onCreateDevicePrefsRequested);
    on<ReadDevicePrefs>(onReadDevicePrefsRequested);
    on<UpdateDevicePrefs>(onUpdateDevicePrefsRequested);
  }
  final CreateDevicePrefsUseCase createDevicePrefsUseCase;
  final ReadDevicePrefsUseCase readDevicePrefsUseCase;
  final UpdateDevicePrefsUseCase updateDevicePrefsUseCase;

  Future<void> onCreateDevicePrefsRequested(
    CreateDevicePrefs event,
    Emitter<DevicePrefsState> emit,
  ) async {
    final createDeviceResult = await createDevicePrefsUseCase.execute(
      const NoParams(),
    );
    createDeviceResult.fold(
      (failure) => null,
      (devicePrefs) => emit(DevicePrefsReaded(devicePrefs: devicePrefs)),
    );
  }

  Future<void> onReadDevicePrefsRequested(
    ReadDevicePrefs event,
    Emitter<DevicePrefsState> emit,
  ) async {
    final readDeviceResult =
        await readDevicePrefsUseCase.execute(const NoParams());
    readDeviceResult.fold(
      (failure) => null,
      (devicePrefs) => emit(DevicePrefsReaded(devicePrefs: devicePrefs)),
    );
  }

  Future<void> onUpdateDevicePrefsRequested(
    UpdateDevicePrefs event,
    Emitter<DevicePrefsState> emit,
  ) async {
    final updateResult =
        await updateDevicePrefsUseCase.execute(event.devicePrefs);
    updateResult.fold(
      (failure) => null,
      (devicePrefs) {
        emit(const DevicePrefsUnreaded());
        emit(DevicePrefsReaded(devicePrefs: devicePrefs));
      },
    );
  }
}
