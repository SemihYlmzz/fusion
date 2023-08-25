import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/delete_request_repository/domain/entities/delete_request.dart';
import 'package:fusion/repositories/delete_request_repository/domain/repository/delete_request_repository.dart';
import 'package:fusion/repositories/user_repository/domain/usecase/params/uid_params.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';

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
