import 'package:fusion/repositories/auth_repository/domain/entities/auth_entity.dart';
import 'package:fusion/repositories/auth_repository/domain/repository/auth_repository.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/params/no_params.dart';
import 'package:fusion/utils/usecase.dart';

class CheckUserAuthUseCase extends NonFutureUseCase<AuthEntity, NoParams> {
  CheckUserAuthUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  AuthEntity execute(NoParams params) {
    return authRepository.checkUserAuth();
  }
}
