import 'package:fpdart/fpdart.dart';

import '../../../../../utils/failure.dart';
import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../entities/user.dart';
import '../../repository/user_repository.dart';

class UpdateUserWithUidUseCase extends UseCase<Either<Failure, User>, User> {
  UpdateUserWithUidUseCase({required this.userRepository});
  final UserRepository userRepository;

  @override
  FutureEither<User> execute(User params) async {
    return userRepository.updateUserWithUid(updatedUser: params);
  }
}
