import 'package:fpdart/fpdart.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
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
