import '../../../../../utils/usecase.dart';
import '../../entities/auth_entity.dart';
import '../../repository/auth_repository.dart';
import '../params/no_params.dart';

class AuthEntityUseCase extends StreamUseCase<AuthEntity, NoParams> {
  final AuthRepository authRepository;

  AuthEntityUseCase({required this.authRepository});

  @override
  Stream<AuthEntity> execute(params) {
    return authRepository.authEntity;
  }
}
