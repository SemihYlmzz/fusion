import 'package:fpdart/fpdart.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../repository/user_repository.dart';
import '../params/no_params.dart';

class RefreshDeckUseCase extends UseCase<Either<Failure, void>, NoParams> {
  RefreshDeckUseCase({required this.userRepository});
  final UserRepository userRepository;

  @override
  FutureUnit execute(NoParams params) async {
    return userRepository.refreshDeck();
  }
}
