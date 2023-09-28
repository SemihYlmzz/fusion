import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/user.dart';

abstract class UserDatasource {
  FutureEither<User> createUser({required User userEntity});

  FutureEither<User> readUserWithUid({required String uid});

  StreamEither<User> watchUserWithUid();

  FutureEither<User> updateUserWithUid({required User updatedUser});

  FutureUnit changeUsername({required String newUsername});

  FutureUnit refreshDeck();

  FutureUnit deleteUser({required String uid});
}
