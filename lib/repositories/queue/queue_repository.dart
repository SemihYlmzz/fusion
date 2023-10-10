import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/exceptions/exceptions.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:fusion/repositories/repositories.dart';

import '../../core/typedefs/typedefs.dart';

class QueueRepository {
  QueueRepository(this._userDatasource, this._networkInfo);
  final QueueDatasource _userDatasource;
  final NetworkInfo _networkInfo;

  FutureEither<QueueModel> enterQueue() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      final queueModel = await _userDatasource.enterQueue();
      return Right(queueModel);
    } on EnterQueueExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  FutureUnit leaveQueue() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      await _userDatasource.leaveQueue();
      return const Right(unit);
    } on LeaveQueueExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  FutureEither<QueueModel?> checkQueue() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(Failure.network());
    }
    try {
      final queueModel = await _userDatasource.checkQueue();
      return Right(queueModel);
    } on ServerException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
