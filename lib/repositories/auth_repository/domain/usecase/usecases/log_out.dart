import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/auth_repository/domain/repository/auth_repository.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/params/no_params.dart';
import 'package:fusion/utils/failure.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:fusion/utils/usecase.dart';

class LogOutUseCase extends UseCase<Either<Failure, Unit>, NoParams> {
  LogOutUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  FutureUnit execute(NoParams params) async {
    return authRepository.logOut();
  }
}
