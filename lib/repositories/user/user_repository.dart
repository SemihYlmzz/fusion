import 'package:fpdart/fpdart.dart';
import 'package:fusion/core/errors/failure/failure.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:fusion/repositories/user/user.dart';

import '../../core/typedefs/typedefs.dart';

class UserRepository {
  UserRepository(
    this._userDatasource,
    this._networkInfo,
  );
  final UserDatasource _userDatasource;
  final NetworkInfo _networkInfo;

  FutureEither<UserModel?> readUserWithUid({
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

  StreamEither<UserModel> watchUserWithUid() async* {
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
