import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.dateOfCreate,
    required this.uid,
    required this.username,
    required this.accountnameChangeEligibilityDate,
    required this.lastActivityDate,
    required this.deck,
    required this.leaguePoint,
    this.accountDeletionScheduledDate,
    this.email,
    this.gameId,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('accountDeletionScheduledDate') ||
        !map.containsKey('dateOfCreate') ||
        !map.containsKey('email') ||
        !map.containsKey('uid') ||
        !map.containsKey('leaguePoint') ||
        !map.containsKey('username') ||
        !map.containsKey('accountnameChangeEligibilityDate') ||
        !map.containsKey('lastActivityDate') ||
        !map.containsKey('gameId') ||
        !map.containsKey('deck')) {
      throw Exception('Map data does not contain all keys');
    }
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
      leaguePoint: map['leaguePoint'] as int,
      username: map['username'] as String,
      accountnameChangeEligibilityDate: DateTime.fromMillisecondsSinceEpoch(
        map['accountnameChangeEligibilityDate'] as int,
      ),
      lastActivityDate: DateTime.fromMillisecondsSinceEpoch(
        map['lastActivityDate'] as int,
      ),
      gameId: map['gameId'] as String?,
      deck: (map['deck'] as List<dynamic>).cast<String>(),
    );
  }

  final DateTime? accountDeletionScheduledDate;
  final DateTime dateOfCreate;
  final String? email;
  final String uid;
  final int leaguePoint;
  final String username;
  final DateTime accountnameChangeEligibilityDate;
  final DateTime lastActivityDate;
  final String? gameId;
  final List<String> deck;

  UserModel copyWith({
    DateTime? accountDeletionScheduledDate,
    DateTime? dateOfCreate,
    String? email,
    String? uid,
    int? leaguePoint,
    String? username,
    DateTime? accountnameChangeEligibilityDate,
    DateTime? lastActivityDate,
    String? gameId,
    List<String>? deck,
  }) {
    return UserModel(
      accountDeletionScheduledDate:
          accountDeletionScheduledDate ?? this.accountDeletionScheduledDate,
      dateOfCreate: dateOfCreate ?? this.dateOfCreate,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      leaguePoint: leaguePoint ?? this.leaguePoint,
      username: username ?? this.username,
      accountnameChangeEligibilityDate: accountnameChangeEligibilityDate ??
          this.accountnameChangeEligibilityDate,
      lastActivityDate: lastActivityDate ?? this.lastActivityDate,
      gameId: gameId ?? this.gameId,
      deck: deck ?? this.deck,
    );
  }

  @override
  List<Object?> get props => [
        dateOfCreate,
        uid,
        leaguePoint,
        username,
        accountnameChangeEligibilityDate,
        lastActivityDate,
        deck,
        accountDeletionScheduledDate,
        email,
        gameId,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountDeletionScheduledDate':
          accountDeletionScheduledDate?.millisecondsSinceEpoch,
      'dateOfCreate': dateOfCreate.millisecondsSinceEpoch,
      'email': email,
      'uid': uid,
      'leaguePoint': leaguePoint,
      'username': username,
      'accountnameChangeEligibilityDate':
          accountnameChangeEligibilityDate.millisecondsSinceEpoch,
      'lastActivityDate': lastActivityDate.millisecondsSinceEpoch,
      'gameId': gameId,
    };
  }
}
