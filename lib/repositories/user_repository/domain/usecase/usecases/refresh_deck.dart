import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/params/no_params.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../repository/user_repository.dart';

class RefreshDeckUseCase extends UseCase<Either<Failure, void>, NoParams> {
  RefreshDeckUseCase({required this.userRepository});
  final UserRepository userRepository;

  @override
  FutureUnit execute(NoParams params) async {
    return userRepository.refreshDeck();
  }
}
