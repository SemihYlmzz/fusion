import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:fusion/repositories/user/data/errors/errors.dart';

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
      return const Left(Failure.network);
    }
    try {
      final readedUserModel = await _userDatasource.readUserWithUid(
        uid: uid,
      );
      return Right(readedUserModel);
    } on ReadUserWithUidExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  StreamEither<User> watchUserWithUid() async* {
    if (!(await _networkInfo.isConnected)) {
      yield const Left(Failure.network);
    }
    try {
      final userStream = _userDatasource.watchUserWithUid();
      await for (final user in userStream) {
        yield Right(user);
      }
    } on WatchUserWithUidExceptions catch (e) {
      yield Left(Failure(message: e.message));
    }
  }

  @override
  FutureUnit changeUsername({required String newUsername}) async {
    if (!(await _networkInfo.isConnected)) {
      return const Left(Failure.network);
    }
    try {
      await _userDatasource.changeUsername(newUsername: newUsername);
      return const Right(unit);
    } on ChangeUsernameExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  FutureUnit refreshDeck() async {
    if (!(await _networkInfo.isConnected)) {
      return const Left(Failure.network);
    }
    try {
      await _userDatasource.refreshDeck();
      return const Right(unit);
    } on RefreshDeckExceptions catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
