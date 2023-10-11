import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';
import 'package:fusion/repositories/repositories.dart';

part 'device_prefs_event.dart';
part 'device_prefs_state.dart';

class DevicePrefsBloc extends Bloc<DevicePrefsEvent, DevicePrefsState> {
  DevicePrefsBloc({
    required DevicePrefsRepository devicePrefsRepository,
  })  : _devicePrefsRepository = devicePrefsRepository,
        super(const DevicePrefsInitialized()) {
    on<CreateDevicePrefs>(_onCreateDevicePrefs);
    on<ReadDevicePrefs>(_onReadDevicePrefs);
    on<UpdateDevicePrefs>(_onUpdateDevicePrefs);
    on<ClearDevicePrefsErrorMessage>(_onClearDevicePrefsErrorMessage);
  }
  final DevicePrefsRepository _devicePrefsRepository;

  Future<void> _onCreateDevicePrefs(
    CreateDevicePrefs event,
    Emitter<DevicePrefsState> emit,
  ) async {
    final createDeviceResult = await _devicePrefsRepository.createDevicePrefs();
    createDeviceResult.fold(
      (failure) => DevicePrefsHasError(
        errorDisplayType: event.errorDisplayType,
        errorCleanType: event.errorCleanType,
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
    final readDeviceResult = await _devicePrefsRepository.readDevicePrefs();
    readDeviceResult.fold(
      (failure) => DevicePrefsHasError(
        errorDisplayType: event.errorDisplayType,
        errorCleanType: event.errorCleanType,
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
    //  if (event.devicePrefs == state) {
    //  return;
    //  }
    final updateResult = await _devicePrefsRepository.updateDevicePrefs(
      updatedDevicePrefs: event.devicePrefs,
    );
    updateResult.fold(
      (failure) => DevicePrefsHasError(
        errorDisplayType: event.errorDisplayType,
        errorCleanType: event.errorCleanType,
        errorMessage: failure.message,
        devicePrefs: state.devicePrefs,
      ),
      (devicePrefs) {
        emit(state.copyWith(devicePrefs: devicePrefs));
      },
    );
  }

  Future<void> _onClearDevicePrefsErrorMessage(
    ClearDevicePrefsErrorMessage event,
    Emitter<DevicePrefsState> emit,
  ) async {
    if (state.devicePrefs == DevicePrefsModel.empty) {
      emit(const DevicePrefsUnreaded());
    } else {
      emit(DevicePrefsReaded(devicePrefs: state.devicePrefs));
    }
  }
}
