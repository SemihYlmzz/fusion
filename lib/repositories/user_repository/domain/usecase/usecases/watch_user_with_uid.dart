import 'package:fpdart/fpdart.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/user.dart';
import '../../repository/user_repository.dart';
import '../params/no_params.dart';

class WatchUserWithUidUseCase
    extends StreamUseCase<Either<Failure, User>, NoParams> {
  WatchUserWithUidUseCase({required this.userRepository});
  final UserRepository userRepository;

  @override
  StreamEither<User> execute(NoParams params) {
    return userRepository.watchUserWithUid();
  }
}
