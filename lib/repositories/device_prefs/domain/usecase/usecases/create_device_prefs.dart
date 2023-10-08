import 'package:fpdart/fpdart.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/device_prefs.dart';
import '../../repository/device_prefs_repository.dart';

class CreateDevicePrefsUseCase
    extends UseCase<Either<Failure, DevicePrefs>, NoParams> {
  CreateDevicePrefsUseCase({required this.devicePrefsRepository});
  final DevicePrefsRepository devicePrefsRepository;

  @override
  FutureEither<DevicePrefs> execute(NoParams params) async {
    return devicePrefsRepository.createDevicePrefs();
  }
}

class NoParams {
  const NoParams();
}
