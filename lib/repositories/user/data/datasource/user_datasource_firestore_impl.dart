import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fusion/repositories/user/data/errors/errors.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import 'user_datasource.dart';

class UserFields {
  static const accountDeletionScheduledDate = 'accountDeletionScheduledDate';
  static const dateOfCreate = 'dateOfCreate';
  static const email = 'email';
  static const uid = 'uid';
  static const username = 'username';
  static const accountnameChangeEligibilityDate =
      'accountnameChangeEligibilityDate';
  static const lastActivityDate = 'lastActivityDate';
  static const gameId = 'gameId';
  static const avatarId = 'avatarId';
  static const deck = 'deck';
}

class UserDataSourceFirebaseImpl implements UserDatasource {
  final firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = auth.FirebaseAuth.instance;
  final usersCollectionNameString = 'users';

  @override
  Future<UserModel?> readUserWithUid({required String uid}) async {
    try {
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(usersCollectionNameString)
          .doc(uid)
          .get();

      final userDocumentData = documentSnapshot.data() as Map<String, dynamic>?;
      if (userDocumentData == null) {
        return null;
      }
      return UserModel.fromMap(userDocumentData);
    } catch (e) {
      if (e is ReadUserWithUidExceptions) {
        rethrow;
      }
      throw ReadUserWithUidExceptions.unknown;
    }
  }

  @override
  Stream<UserModel> watchUserWithUid() async* {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        yield throw WatchUserWithUidExceptions.watchFailed;
      }
      final DocumentReference userDocRef =
          firebaseFirestore.collection(usersCollectionNameString).doc(
                user.uid,
              );
      yield* userDocRef.snapshots().map((snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          final data = snapshot.data() as Map<String, dynamic>?;
          final currentUserModel = UserModel.fromMap(data!);
          final userEntity = UserModel.toEntity(currentUserModel);
          return UserModel.fromEntity(userEntity);
        } else {
          throw WatchUserWithUidExceptions.watchFailed;
        }
      });
    } catch (e) {
      if (e is WatchUserWithUidExceptions) {
        rethrow;
      }
      yield throw WatchUserWithUidExceptions.unknown;
    }
  }

  @override
  Future<void> changeUsername({required String newUsername}) async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/changeUsername';
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw ChangeUsernameExceptions.changeFailed;
    }
    try {
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw ChangeUsernameExceptions.changeFailed;
      }
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
        body: jsonEncode({
          'newUsername': newUsername,
        }),
      );

      if (response.statusCode != 200) {
        throw ChangeUsernameExceptions.changeFailed;
      }
      return;
    } catch (e) {
      if (e is ChangeUsernameExceptions) {
        rethrow;
      }
      throw ChangeUsernameExceptions.unknown;
    }
  }

  @override
  Future<void> refreshDeck() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/refreshDeck';
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw RefreshDeckExceptions.refreshFailed;
    }
    try {
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw RefreshDeckExceptions.refreshFailed;
      }
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode != 200) {
        throw RefreshDeckExceptions.refreshFailed;
      }
      return;
    } catch (e) {
      if (e is RefreshDeckExceptions) {
        rethrow;
      }
      throw RefreshDeckExceptions.unknown;
    }
  }
}
