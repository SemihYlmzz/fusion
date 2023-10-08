import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/params/no_params.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/usecase/usecases/create_device_prefs.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/usecase/usecases/read_device_prefs.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/usecase/usecases/update_device_prefs.dart';

part 'device_prefs_event.dart';
part 'device_prefs_state.dart';

class DevicePrefsBloc extends Bloc<DevicePrefsEvent, DevicePrefsState> {
  DevicePrefsBloc({
    required CreateDevicePrefsUseCase createDevicePrefsUseCase,
    required ReadDevicePrefsUseCase readDevicePrefsUseCase,
    required UpdateDevicePrefsUseCase updateDevicePrefsUseCase,
  })  : _updateDevicePrefsUseCase = updateDevicePrefsUseCase,
        _readDevicePrefsUseCase = readDevicePrefsUseCase,
        _createDevicePrefsUseCase = createDevicePrefsUseCase,
        super(const DevicePrefsInitialized()) {
    on<CreateDevicePrefs>(_onCreateDevicePrefs);
    on<ReadDevicePrefs>(_onReadDevicePrefs);
    on<UpdateDevicePrefs>(_onUpdateDevicePrefs);
    on<ClearDevicePrefsErrorMessage>(_onClearDevicePrefsErrorMessage);
  }
  final CreateDevicePrefsUseCase _createDevicePrefsUseCase;
  final ReadDevicePrefsUseCase _readDevicePrefsUseCase;
  final UpdateDevicePrefsUseCase _updateDevicePrefsUseCase;

  Future<void> _onCreateDevicePrefs(
    CreateDevicePrefs event,
    Emitter<DevicePrefsState> emit,
  ) async {
    final createDeviceResult = await _createDevicePrefsUseCase.execute(
      const NoParams(),
    );
    createDeviceResult.fold(
      (failure) => DevicePrefsHasError(
        errorMessage: failure.message,
        devicePrefs: state.devicePrefs,
      ),
      (devicePrefs) => emit(DevicePrefsReaded(devicePrefs: devicePrefs)),
    );
  }

  Future<void> _onReadDevicePrefs(
    ReadDevicePrefs event,
    Emitter<DevicePrefsState> emit,
  ) async {
    final readDeviceResult =
        await _readDevicePrefsUseCase.execute(const NoParams());
    readDeviceResult.fold(
      (failure) => DevicePrefsHasError(
        errorMessage: failure.message,
        devicePrefs: state.devicePrefs,
      ),
      (devicePrefs) => emit(DevicePrefsReaded(devicePrefs: devicePrefs)),
    );
  }

  Future<void> _onUpdateDevicePrefs(
    UpdateDevicePrefs event,
    Emitter<DevicePrefsState> emit,
  ) async {
    final updateResult =
        await _updateDevicePrefsUseCase.execute(event.devicePrefs);
    updateResult.fold(
      (failure) => DevicePrefsHasError(
        errorMessage: failure.message,
        devicePrefs: state.devicePrefs,
      ),
      (devicePrefs) {
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
