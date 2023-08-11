import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../repository/device_prefs_repository.dart';

class CreateDevicePrefsUseCase
    extends UseCase<Either<Failure, DevicePrefs>, DevicePrefs> {
  CreateDevicePrefsUseCase({required this.devicePrefsRepository});
  final DevicePrefsRepository devicePrefsRepository;

  @override
  FutureEither<DevicePrefs> execute(DevicePrefs params) async {
    return devicePrefsRepository.updateDevicePrefs(updatedDevicePrefs: params);
  }
}
