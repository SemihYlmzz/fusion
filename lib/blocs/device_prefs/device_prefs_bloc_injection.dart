import 'package:fusion/repositories/device_prefs_repository/domain/usecase/usecases/read_device_prefs.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/usecase/usecases/update_device_prefs.dart';

import '../../../initialize/injection_container.dart';

import '../../repositories/device_prefs_repository/domain/usecase/usecases/create_device_prefs.dart';
import 'device_prefs_bloc.dart';

class DevicePrefsBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerSingleton<DevicePrefsBloc>(
      DevicePrefsBloc(
        createDevicePrefsUseCase: getIt<CreateDevicePrefsUseCase>(),
        readDevicePrefsUseCase: getIt<ReadDevicePrefsUseCase>(),
        updateDevicePrefsUseCase: getIt<UpdateDevicePrefsUseCase>(),
      ),
    );
  }
}
