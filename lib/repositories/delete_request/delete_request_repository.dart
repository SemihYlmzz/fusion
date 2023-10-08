import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:fusion/repositories/delete_request/errors/create_delete_request_exceptions.dart';

import '../../core/typedefs/typedefs.dart';
import 'delete_request_datasource.dart';
import 'models/models.dart';

class DeleteRequestRepository {
  DeleteRequestRepository(this._deleteRequestDatasource, this.networkInfo);
  final DeleteRequestDatasource _deleteRequestDatasource;
  final NetworkInfo networkInfo;

  FutureEither<DeleteRequestModel> createDeleteRequest() async {
    if (!(await networkInfo.isConnected)) {
      return const Left(Failure.network);
    }
    try {
      final deleteRequestModel =
          await _deleteRequestDatasource.createDeleteRequest();
      return Right(deleteRequestModel);
    } on CreateDeleteRequestExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
