import '../../../../../core/usecases/usecase.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_repository.dart';
import '../params/no_params.dart';

class CheckUserAuthUseCase extends NonFutureUseCase<AuthEntity, NoParams> {
  CheckUserAuthUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  AuthEntity execute(NoParams params) {
    return authRepository.checkUserAuth();
  }
}
