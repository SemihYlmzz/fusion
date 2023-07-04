import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/auth_repository/domain/entities/auth_entity.dart';
import 'package:fusion/repositories/auth_repository/domain/repository/auth_repository.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/params/no_params.dart';
import 'package:fusion/utils/failure.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:fusion/utils/usecase.dart';

class LoginWithFacebookUseCase
    extends UseCase<Either<Failure, AuthEntity>, NoParams> {
  LoginWithFacebookUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  FutureEither<AuthEntity> execute(NoParams params) async {
    return authRepository.logInWithFacebook();
  }
}
