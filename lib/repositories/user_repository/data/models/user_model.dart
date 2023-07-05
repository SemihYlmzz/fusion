import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.dateOfCreate,
    required super.uid,
    required super.username,
    required super.accountnameChangeEligibilityDate,
    required super.lastActivityDate,
    required super.deck,
    super.accountDeletionScheduledDate,
    super.email,
    super.gameId,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('accountDeletionScheduledDate') ||
        !map.containsKey('dateOfCreate') ||
        !map.containsKey('email') ||
        !map.containsKey('uid') ||
        !map.containsKey('username') ||
        !map.containsKey('accountnameChangeEligibilityDate') ||
        !map.containsKey('lastActivityDate') ||
        !map.containsKey('gameId') ||
        !map.containsKey('deck')) {
      throw Exception('Map data does not contain all keys');
    }

    // TODO map içindekileri UserFields.email olarak hataya yer verme
    return UserModel(
      accountDeletionScheduledDate: map['accountDeletionScheduledDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['accountDeletionScheduledDate'] as int,
            )
          : null,
      dateOfCreate: DateTime.fromMillisecondsSinceEpoch(
        map['dateOfCreate'] as int,
      ),
      email: map['email'] as String,
      uid: map['uid'] as String,
      username: map['username'] as String,
      accountnameChangeEligibilityDate: DateTime.fromMillisecondsSinceEpoch(
        map['accountnameChangeEligibilityDate'] as int,
      ),
      lastActivityDate: DateTime.fromMillisecondsSinceEpoch(
        map['lastActivityDate'] as int,
      ),
      gameId: map['gameId'] as String,
      deck: [...map['deck'] as List<String>],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountDeletionScheduledDate':
          accountDeletionScheduledDate?.millisecondsSinceEpoch,
      'dateOfCreate': dateOfCreate.millisecondsSinceEpoch,
      'email': email,
      'uid': uid,
      'username': username,
      'accountnameChangeEligibilityDate':
          accountnameChangeEligibilityDate.millisecondsSinceEpoch,
      'lastActivityDate': lastActivityDate.millisecondsSinceEpoch,
      'gameId': gameId,
    };
  }

  // ignore: prefer_constructors_over_static_methods
  static UserModel fromEntity(User userEntity) {
    return UserModel(
      accountDeletionScheduledDate: userEntity.accountDeletionScheduledDate,
      dateOfCreate: userEntity.dateOfCreate,
      email: userEntity.email,
      uid: userEntity.uid,
      username: userEntity.username,
      accountnameChangeEligibilityDate:
          userEntity.accountnameChangeEligibilityDate,
      lastActivityDate: userEntity.lastActivityDate,
      gameId: userEntity.gameId,
      deck: userEntity.deck,
    );
  }

  static User toEntity(UserModel userModel) {
    return User(
      accountDeletionScheduledDate: userModel.accountDeletionScheduledDate,
      dateOfCreate: userModel.dateOfCreate,
      email: userModel.email,
      uid: userModel.uid,
      username: userModel.username,
      accountnameChangeEligibilityDate:
          userModel.accountnameChangeEligibilityDate,
      lastActivityDate: userModel.lastActivityDate,
      gameId: userModel.gameId,
      deck: userModel.deck,
    );
  }
}
