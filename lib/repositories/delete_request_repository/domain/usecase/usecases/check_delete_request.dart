import 'package:fpdart/fpdart.dart';

import '../../../../../utils/failure.dart';
import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../../../user_repository/domain/usecase/params/uid_params.dart';
import '../../entities/delete_request.dart';
import '../../repository/delete_request_repository.dart';

class CheckDeleteRequestUseCase
    extends UseCase<Either<Failure, DeleteRequest>, UidParams> {
  CheckDeleteRequestUseCase({required this.deleteRepository});
  final DeleteRequestRepository deleteRepository;

  @override
  FutureEither<DeleteRequest> execute(UidParams params) async {
    return deleteRepository.checkDeleteRequest(
      uid: params.uid,
    );
  }
}
