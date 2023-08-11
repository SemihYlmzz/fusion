import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/params/no_params.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
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
