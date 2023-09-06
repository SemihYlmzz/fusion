import 'package:fpdart/fpdart.dart';

import '../../../../../utils/failure.dart';
import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../../../auth_repository/domain/usecase/params/no_params.dart';
import '../../entities/device_prefs.dart';
import '../../repository/device_prefs_repository.dart';

class ReadDevicePrefsUseCase
    extends UseCase<Either<Failure, DevicePrefs>, NoParams> {
  ReadDevicePrefsUseCase({required this.devicePrefsRepository});
  final DevicePrefsRepository devicePrefsRepository;

  @override
  FutureEither<DevicePrefs> execute(NoParams params) async {
    return devicePrefsRepository.readDevicePrefs();
  }
}
