import 'package:fpdart/fpdart.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_repository.dart';
import '../params/no_params.dart';

class LoginWithGoogleUseCase
    extends UseCase<Either<Failure, AuthEntity>, NoParams> {
  LoginWithGoogleUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  FutureEither<AuthEntity> execute(NoParams params) async {
    return authRepository.logInWithGoogle();
  }
}
