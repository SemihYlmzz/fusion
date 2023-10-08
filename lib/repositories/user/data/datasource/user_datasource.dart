import 'package:fusion/repositories/user/data/models/user_model.dart';


abstract class UserDatasource {

  Future<UserModel?> readUserWithUid({required String uid});

  Stream<UserModel> watchUserWithUid();

  Future<void> changeUsername({required String newUsername});

  Future<void> refreshDeck();

}
