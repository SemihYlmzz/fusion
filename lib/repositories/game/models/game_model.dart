import 'package:equatable/equatable.dart';

import 'player_model.dart';

class GameModel extends Equatable {
  const GameModel({
    required this.createdAt,
    required this.currentTurn,
    required this.gameId,
    required this.gameStatus,
    required this.acceptedUserIds,
    required this.player1,
    required this.player2,
    required this.updatedAt,
  });

  factory GameModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('createdAt') ||
        !map.containsKey('currentTurn') ||
        !map.containsKey('gameId') ||
        !map.containsKey('gameStatus') ||
        !map.containsKey('acceptedUserIds') ||
        !map.containsKey('player1') ||
        !map.containsKey('player2') ||
        !map.containsKey('updatedAt')) {
      throw Exception('Invalid map data');
    }
    return GameModel(
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      currentTurn: map['currentTurn'] as int,
      gameId: map['gameId'] as String,
      gameStatus: map['gameStatus'] as int,
      acceptedUserIds: map['acceptedUserIds'] as List<dynamic>,
      player1: PlayerModel.fromMap(map['player1'] as Map<String, dynamic>),
      player2: PlayerModel.fromMap(map['player2'] as Map<String, dynamic>),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  GameModel copyWith({
    DateTime? createdAt,
    int? currentTurn,
    String? gameId,
    int? gameStatus,
    List<dynamic>? acceptedUserIds,
    PlayerModel? player1,
    PlayerModel? player2,
    DateTime? updatedAt,
  }) {
    return GameModel(
      createdAt: createdAt ?? this.createdAt,
      currentTurn: currentTurn ?? this.currentTurn,
      gameId: gameId ?? this.gameId,
      gameStatus: gameStatus ?? this.gameStatus,
      acceptedUserIds: acceptedUserIds ?? this.acceptedUserIds,
      player1: player1 ?? this.player1,
      player2: player2 ?? this.player2,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  final DateTime createdAt;
  final int currentTurn;
  final String gameId;
  final int gameStatus;
  final List<dynamic> acceptedUserIds;
  final PlayerModel player1;
  final PlayerModel player2;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        createdAt,
        currentTurn,
        gameId,
        gameStatus,
        acceptedUserIds,
        player1,
        player2,
        updatedAt,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt.millisecondsSinceEpoch,
      'currentTurn': currentTurn,
      'gameId': gameId,
      'gameStatus': gameStatus,
      'acceptedUserIds': acceptedUserIds,
      'player1': player1.toMap(),
      'player2': player2.toMap(),
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }
}
