import 'package:fpdart/fpdart.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../entities/user.dart';
import '../../repository/user_repository.dart';

class CreateUserUseCase extends UseCase<Either<Failure, User>, User> {
  CreateUserUseCase({required this.userRepository});
  final UserRepository userRepository;

  @override
  FutureEither<User> execute(User params) async {
    return userRepository.createUser(userEntity: params);
  }
}
