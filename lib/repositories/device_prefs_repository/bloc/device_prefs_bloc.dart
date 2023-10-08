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
  }) : super(const DevicePrefsInitialized()) {
    on<CreateDevicePrefs>(_onCreateDevicePrefs);
    on<ReadDevicePrefs>(_onReadDevicePrefs);
    on<UpdateDevicePrefs>(_onUpdateDevicePrefs);
    on<ClearDevicePrefsErrorMessage>(_onClearDevicePrefsErrorMessage);
  }
  final CreateDevicePrefsUseCase createDevicePrefsUseCase;
  final ReadDevicePrefsUseCase readDevicePrefsUseCase;
  final UpdateDevicePrefsUseCase updateDevicePrefsUseCase;

  Future<void> _onCreateDevicePrefs(
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

  Future<void> _onReadDevicePrefs(
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

  Future<void> _onUpdateDevicePrefs(
    UpdateDevicePrefs event,
    Emitter<DevicePrefsState> emit,
  ) async {
    final updateResult =
        await updateDevicePrefsUseCase.execute(event.devicePrefs);
    updateResult.fold(
      (failure) => null,
      (devicePrefs) {
        emit(const DevicePrefsInitialized());
        emit(DevicePrefsReaded(devicePrefs: devicePrefs));
      },
    );
  }

  Future<void> _onClearDevicePrefsErrorMessage(
    ClearDevicePrefsErrorMessage event,
    Emitter<DevicePrefsState> emit,
  ) async {
    if (state.devicePrefs == DevicePrefs.empty) {
      emit(const DevicePrefsUnreaded());
    } else {
      emit(DevicePrefsReaded(devicePrefs: state.devicePrefs));
    }
  }
}
