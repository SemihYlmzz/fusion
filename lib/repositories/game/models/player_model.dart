import 'package:equatable/equatable.dart';

class PlayerModel extends Equatable {
  const PlayerModel({
    required this.isReady,
    required this.username,
    required this.uid,
  });

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('isReady') ||
        !map.containsKey('username') ||
        !map.containsKey('uid')) {
      throw Exception('Invalid map data');
    }
    return PlayerModel(
      isReady: map['isReady'] as bool,
      username: map['username'] as String,
      uid: map['uid'] as String,
    );
  }

  PlayerModel copyWith({
    bool? isReady,
    String? username,
    String? uid,
  }) {
    return PlayerModel(
      isReady: isReady ?? this.isReady,
      username: username ?? this.username,
      uid: uid ?? this.uid,
    );
  }

  final bool isReady;
  final String username;
  final String uid;

  @override
  List<Object?> get props => [
        isReady,
        username,
        uid,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isReady': isReady,
      'username': username,
      'uid': uid,
    };
  }
}
