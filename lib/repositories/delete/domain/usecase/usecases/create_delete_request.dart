import 'package:fpdart/fpdart.dart';

import '../../../../../core/errors/failure/failure.dart';
import '../../../../../core/typedefs/typedefs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/delete_request.dart';
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
