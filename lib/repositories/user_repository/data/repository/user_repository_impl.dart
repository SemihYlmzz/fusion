import 'package:fusion/utils/typedefs.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user_repository.dart';
import '../datasource/user_datasource.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
    UserDatasource userDatasource,
  ) : _userDatasource = userDatasource;
  final UserDatasource _userDatasource;

  @override
  FutureEither<User> createUser({
    required User userEntity,
  }) async {
    return _userDatasource.createUser(
      userEntity: UserModel.fromEntity(userEntity),
    );
  }

  @override
  FutureEither<User> readUserWithUid({
    required String uid,
  }) async {
    return _userDatasource.readUserWithUid(
      uid: uid,
    );
  }

  @override
  StreamEither<User> watchUserWithUid() {
    return _userDatasource.watchUserWithUid();
  }

  @override
  FutureUnit changeUsername({required String newUsername}) {
    return _userDatasource.changeUsername(newUsername: newUsername);
  }

  @override
  FutureUnit refreshDeck() {
    return _userDatasource.refreshDeck();
  }

  @override
  FutureEither<User> updateUserWithUid({
    required User updatedUser,
  }) async {
    return _userDatasource.updateUserWithUid(
      updatedUser: updatedUser,
    );
  }

  @override
  FutureUnit deleteUser({
    required String uid,
  }) async {
    return _userDatasource.deleteUser(
      uid: uid,
    );
  }
}
