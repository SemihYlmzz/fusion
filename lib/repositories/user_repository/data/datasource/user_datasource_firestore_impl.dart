import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions/exceptions.dart';
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
      throw const ServerException(message: 'Error occured while reading user.');
    }
  }

  @override
  Stream<UserModel> watchUserWithUid() async* {
    try {
      final user = auth.FirebaseAuth.instance.currentUser;
      if (user == null) {
        yield throw const ServerException(message: 'You must be signed in.');
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
          throw const ServerException(message: 'User data not found.');
        }
      });
    } catch (exception) {
      yield throw const ServerException(
        message: 'Error occured while Listening User data.',
      );
    }
  }

  @override
  Future<void> changeUsername({required String newUsername}) async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/changeUsername';
    final user = auth.FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw const ServerException(message: 'You must be signed in.');
    }
    try {
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw const ServerException(
          message: 'Error occured while Changing Username. Please try again.',
        );
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

      if (response.statusCode == 200) {
        return;
      }
      if (response.statusCode == 400) {
        throw ServerException(message: response.body);
      } else {
        throw ServerException(
          message:
              'Error occured while Changing Username. Error code:${response.statusCode}',
        );
      }
    } catch (e) {
      throw const ServerException(
        message: 'Error occured while Changing Username.',
      );
    }
  }

  @override
  Future<void> refreshDeck() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/refreshMyDeck';
    final user = auth.FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw const ServerException(message: 'You must be signed in.');
    }
    try {
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw const ServerException(
          message: 'Error occured while Refreshing Deck. Please try again.',
        );
      }
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode == 200) {
        return;
      }
      if (response.statusCode == 400) {
        throw ServerException(message: response.body);
      } else {
        throw ServerException(
          message:
              'Error occured while Refreshing Deck. Error code:${response.statusCode}',
        );
      }
    } catch (e) {
      throw const ServerException(
        message: 'Error occured while Refreshing Deck.',
      );
    }
  }
}
