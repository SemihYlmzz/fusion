import 'package:fpdart/fpdart.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../auth_repository/domain/usecase/params/no_params.dart';
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
