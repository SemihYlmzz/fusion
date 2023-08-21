import 'package:fusion/utils/typedefs.dart';

import '../entities/user.dart';

abstract class UserRepository {
  FutureEither<User> createUser({required User userEntity});

  FutureEither<User> readUserWithUid({required String uid});

  StreamEither<User> watchUserWithUid({required String uid});

  FutureUnit changeUsername({required String newUsername});

  FutureEither<User> updateUserWithUid({required User updatedUser});

  FutureUnit deleteUser({required String uid});
}
