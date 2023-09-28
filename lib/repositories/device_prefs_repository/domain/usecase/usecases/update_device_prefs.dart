import 'package:fpdart/fpdart.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/device_prefs.dart';
import '../../repository/device_prefs_repository.dart';

class UpdateDevicePrefsUseCase
    extends UseCase<Either<Failure, DevicePrefs>, DevicePrefs> {
  UpdateDevicePrefsUseCase({required this.devicePrefsRepository});
  final DevicePrefsRepository devicePrefsRepository;

  @override
  FutureEither<DevicePrefs> execute(DevicePrefs params) async {
    return devicePrefsRepository.updateDevicePrefs(updatedDevicePrefs: params);
  }
}
