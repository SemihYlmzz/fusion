import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/delete_request_repository/domain/repository/delete_request_repository.dart';
import 'package:fusion/utils/failure.dart';

import '../../../../../utils/typedefs.dart';
import '../../../../../utils/usecase.dart';
import '../params/no_params.dart';

class CancelDeleteRequestUseCase
    extends UseCase<Either<Failure, void>, NoParams> {
  CancelDeleteRequestUseCase({required this.deleteRepository});
  final DeleteRequestRepository deleteRepository;

  @override
  FutureUnit execute(NoParams params) async {
    return deleteRepository.cancelDeleteRequest();
  }
}
