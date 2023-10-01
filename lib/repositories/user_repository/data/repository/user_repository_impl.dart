import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/exceptions/exceptions.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';

import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user_repository.dart';
import '../datasource/user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
    this._userDatasource,
    this._networkInfo,
  );
  final UserDatasource _userDatasource;
  final NetworkInfo _networkInfo;

  @override
  FutureEither<User?> readUserWithUid({
    required String uid,
  }) async {
    if (!(await _networkInfo.isConnected)) {
      return const Left(NetworkFailure());
    }
    try {
      final readedUserModel = await _userDatasource.readUserWithUid(
        uid: uid,
      );
      return Right(readedUserModel);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  StreamEither<User> watchUserWithUid() async* {
    if (!(await _networkInfo.isConnected)) {
      yield const Left(NetworkFailure());
    }
    try {
      final userStream = _userDatasource.watchUserWithUid();
      await for (final user in userStream) {
        yield Right(user);
      }
    } on ServerException catch (exception) {
      yield Left(ServerFailure(message: exception.message));
    }
  }

  @override
  FutureUnit changeUsername({required String newUsername}) async {
    if (!(await _networkInfo.isConnected)) {
      return const Left(NetworkFailure());
    }
    try {
      await _userDatasource.changeUsername(newUsername: newUsername);
      return const Right(unit);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  FutureUnit refreshDeck() async {
    if (!(await _networkInfo.isConnected)) {
      return const Left(NetworkFailure());
    }
    try {
      await _userDatasource.refreshDeck();
      return const Right(unit);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
