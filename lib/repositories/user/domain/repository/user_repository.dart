import '../../../../core/typedefs/typedefs.dart';
import '../entities/user.dart';

abstract class UserRepository {

  FutureEither<User?> readUserWithUid({required String uid});

  StreamEither<User> watchUserWithUid();

  FutureUnit changeUsername({required String newUsername});

  FutureUnit refreshDeck();

}
