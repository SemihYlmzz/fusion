import 'package:fpdart/fpdart.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../repository/user_repository.dart';
import '../params/uid_params.dart';

class DeleteUserUseCase extends UseCase<Either<Failure, void>, UidParams> {
  DeleteUserUseCase({required this.userRepository});
  final UserRepository userRepository;

  @override
  FutureUnit execute(UidParams params) async {
    return userRepository.deleteUser(uid: params.uid);
  }
}
