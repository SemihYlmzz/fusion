import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/exceptions/exceptions.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';

import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/delete_request.dart';
import '../../domain/repository/delete_request_repository.dart';
import '../datasource/delete_request_datasource.dart';

class DeleteRequestRepositoryImpl implements DeleteRequestRepository {
  DeleteRequestRepositoryImpl(this._deleteRequestDatasource, this.networkInfo);
  final DeleteRequestDatasource _deleteRequestDatasource;
  final NetworkInfo networkInfo;
  @override
  FutureEither<DeleteRequest> createDeleteRequest() async {
    if (!(await networkInfo.isConnected)) {
      return const Left(NetworkFailure());
    }
    try {
      final deleteRequestModel =
          await _deleteRequestDatasource.createDeleteRequest();
      return Right(deleteRequestModel);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
