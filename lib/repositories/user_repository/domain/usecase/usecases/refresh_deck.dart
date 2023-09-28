import 'package:fpdart/fpdart.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
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
