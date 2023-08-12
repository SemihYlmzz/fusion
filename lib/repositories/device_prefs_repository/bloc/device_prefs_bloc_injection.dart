import 'package:fusion/injection_container.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/usecase/usecases/update_device_prefs.dart';

import '../domain/usecase/usecases/create_device_prefs.dart';
import '../domain/usecase/usecases/read_device_prefs.dart';

class DevicePrefsBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<DevicePrefsBloc>(
      () => DevicePrefsBloc(
        createDevicePrefsUseCase: getIt<CreateDevicePrefsUseCase>(),
        readDevicePrefsUseCase: getIt<ReadDevicePrefsUseCase>(),
        updateDevicePrefsUseCase: getIt<UpdateDevicePrefsUseCase>(),
      ),
    );
  }
}
