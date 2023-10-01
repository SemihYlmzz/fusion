import 'package:fpdart/fpdart.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../repository/auth_repository.dart';
import '../params/no_params.dart';

class LogOutUseCase extends UseCase<Either<Failure, Unit>, NoParams> {
  LogOutUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  FutureUnit execute(NoParams params) async {
    return authRepository.logOut();
  }
}
