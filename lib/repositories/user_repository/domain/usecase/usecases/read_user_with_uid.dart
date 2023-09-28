import 'package:fpdart/fpdart.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
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
