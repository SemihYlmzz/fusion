import 'package:equatable/equatable.dart';

class PlayerModel extends Equatable {
  const PlayerModel({
    required this.isReady,
    required this.username,
    required this.uid,
    required this.leaguePoint,
  });

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('isReady') ||
        !map.containsKey('username') ||
        !map.containsKey('uid') ||
        !map.containsKey('leaguePoint')) {
      throw Exception('Invalid map data');
    }
    return PlayerModel(
      isReady: map['isReady'] as bool,
      username: map['username'] as String,
      uid: map['uid'] as String,
      leaguePoint: map['leaguePoint'] as int,
    );
  }

  PlayerModel copyWith({
    bool? isReady,
    String? username,
    String? uid,
    int? leaguePoint,
  }) {
    return PlayerModel(
      isReady: isReady ?? this.isReady,
      username: username ?? this.username,
      uid: uid ?? this.uid,
      leaguePoint: leaguePoint ?? this.leaguePoint,
    );
  }

  final bool isReady;
  final String username;
  final String uid;
  final int leaguePoint;

  @override
  List<Object?> get props => [
        isReady,
        username,
        uid,
        leaguePoint,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isReady': isReady,
      'username': username,
      'uid': uid,
      'leaguePoint': leaguePoint,
    };
  }
}
