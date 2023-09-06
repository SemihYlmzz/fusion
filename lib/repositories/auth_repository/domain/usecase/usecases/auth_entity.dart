import '../../../../../utils/usecase.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_repository.dart';
import '../params/no_params.dart';

class AuthEntityUseCase extends StreamUseCase<AuthEntity, NoParams> {
  AuthEntityUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  Stream<AuthEntity> execute(NoParams params) {
    return authRepository.authEntity;
  }
}
