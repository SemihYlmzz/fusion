import 'package:fpdart/fpdart.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../entities/user.dart';
import '../../repository/user_repository.dart';
import '../params/uid_params.dart';

class ReadUserWithUidUseCase extends UseCase<Either<Failure, User>, UidParams> {
  ReadUserWithUidUseCase({required this.userRepository});
  final UserRepository userRepository;

  @override
  FutureEither<User> execute(UidParams params) async {
    return userRepository.readUserWithUid(uid: params.uid);
  }
}
