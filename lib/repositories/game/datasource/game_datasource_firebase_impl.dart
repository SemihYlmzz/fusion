import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:http/http.dart' as http;

import '../game.dart';

class GameFields {
  static const createdAt = 'createdAt';
  static const currentTurn = 'currentTurn';
  static const gameId = 'gameId';
  static const gameStatus = 'gameStatus';
  static const acceptedUserIds = 'acceptedUserIds';
  static const updatedAt = 'updatedAt';
  static const player1 = 'player1';
  static const player2 = 'player2';
}

class PlayerFields {
  static const username = 'username';
  static const isReady = 'isReady';
  static const uid = 'uid';
  static const leaguePoint = 'leaguePoint';
}

class GameDataSourceFirebaseImpl implements GameDatasource {
  final firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = auth.FirebaseAuth.instance;
  final gamesCollectionNameString = 'games';

  @override
  Stream<GameModel> watchGameWithGameId({required String gameId}) async* {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        yield throw WatchGameWithGameIdExceptions.watchFailed;
      }
      final DocumentReference gameDocRef =
          firebaseFirestore.collection(gamesCollectionNameString).doc(
                gameId,
              );
      yield* gameDocRef.snapshots().map((snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          final data = snapshot.data() as Map<String, dynamic>?;
          final currentGameModel = GameModel.fromMap(data!);
          return currentGameModel;
        } else {
          throw WatchGameWithGameIdExceptions.watchFailed;
        }
      });
    } catch (e) {
      if (e is WatchGameWithGameIdExceptions) {
        rethrow;
      }
      yield throw WatchGameWithGameIdExceptions.unknown;
    }
  }

  @override
  Future<void> acceptGame() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/acceptGame';
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw AcceptGameExceptions.acceptFailed;
    }
    try {
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw AcceptGameExceptions.acceptFailed;
      }
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode != 200) {
        throw AcceptGameExceptions.acceptFailed;
      }
      return;
    } catch (e) {
      if (e is AcceptGameExceptions) {
        rethrow;
      }
      throw AcceptGameExceptions.unknown;
    }
  }
}
