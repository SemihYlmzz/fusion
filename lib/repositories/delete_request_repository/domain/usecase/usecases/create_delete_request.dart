import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/delete_request_repository/domain/entities/delete_request.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../../repository/delete_request_repository.dart';
import '../params/no_params.dart';

class CreateDeleteRequestUseCase
    extends UseCase<Either<Failure, DeleteRequest>, NoParams> {
  CreateDeleteRequestUseCase({required this.deleteRepository});
  final DeleteRequestRepository deleteRepository;

  @override
  FutureEither<DeleteRequest> execute(NoParams params) async {
    return deleteRepository.createDeleteRequest();
  }
}
