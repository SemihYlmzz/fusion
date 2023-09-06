import 'package:fpdart/fpdart.dart';

import '../../../../../utils/failure.dart';
import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_repository.dart';
import '../params/no_params.dart';

class LoginWithFacebookUseCase
    extends UseCase<Either<Failure, AuthEntity>, NoParams> {
  LoginWithFacebookUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  FutureEither<AuthEntity> execute(NoParams params) async {
    return authRepository.logInWithFacebook();
  }
}
