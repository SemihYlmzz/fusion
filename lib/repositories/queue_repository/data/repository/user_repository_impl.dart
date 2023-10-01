import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/exceptions/exceptions.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';

import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/queue.dart';
import '../../domain/repository/queue_repository.dart';
import '../datasource/queue_datasource.dart';

class QueueRepositoryImpl implements QueueRepository {
  QueueRepositoryImpl(this._userDatasource, this._networkInfo);
  final QueueDatasource _userDatasource;
  final NetworkInfo _networkInfo;

  @override
  FutureEither<Queue> enterQueue() async {
    if (!(await _networkInfo.isConnected)) {
      return const Left(NetworkFailure());
    }
    try {
      final queueModel = await _userDatasource.enterQueue();
      return Right(queueModel);
    } on ServerFailure catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  FutureUnit leaveQueue() async {
    if (!(await _networkInfo.isConnected)) {
      return const Left(NetworkFailure());
    }
    try {
      await _userDatasource.leaveQueue();
      return const Right(unit);
    } on ServerFailure catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  FutureEither<Queue?> checkQueue() async {
    if (!(await _networkInfo.isConnected)) {
      return const Left(NetworkFailure());
    }
    try {
      final queueModel = await _userDatasource.checkQueue();
      return Right(queueModel);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
