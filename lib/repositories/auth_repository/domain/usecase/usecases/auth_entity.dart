import 'package:fusion/repositories/auth_repository/domain/entities/auth_entity.dart';
import 'package:fusion/repositories/auth_repository/domain/repository/auth_repository.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/params/no_params.dart';
import 'package:fusion/utils/usecase.dart';

class AuthEntityUseCase extends StreamUseCase<AuthEntity, NoParams> {
  AuthEntityUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  Stream<AuthEntity> execute(NoParams params) {
    return authRepository.authEntity;
  }
}
