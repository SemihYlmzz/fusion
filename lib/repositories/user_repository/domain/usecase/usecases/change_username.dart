import 'package:fpdart/fpdart.dart';

import '../../../../../utils/failure.dart';
import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../repository/user_repository.dart';
import '../params/user_name_params.dart';

class ChangeUsernameUseCase
    extends UseCase<Either<Failure, void>, UsernameParams> {
  ChangeUsernameUseCase({required this.userRepository});
  final UserRepository userRepository;

  @override
  FutureUnit execute(UsernameParams params) async {
    return userRepository.changeUsername(newUsername: params.username);
  }
}
