import 'package:fpdart/fpdart.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
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
