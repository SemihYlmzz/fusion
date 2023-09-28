import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../core/failure/failure.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/user.dart';
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
  FutureEither<User> createUser({required User userEntity}) async {
    try {
      await firebaseFirestore.runTransaction<void>((transaction) async {
        final DocumentReference userDocRef = firebaseFirestore
            .collection(usersCollectionNameString)
            .doc(userEntity.uid);

        final userSnapshot = await transaction.get(userDocRef);

        if (userSnapshot.exists) {
          throw Exception('Username already exists');
        }

        transaction.set(userDocRef, UserModel.fromEntity(userEntity).toMap());
      });
      return Right(userEntity);
    } catch (e) {
      return Left(Failure('An unexpected error occurred: $e'));
    }
  }

  @override
  FutureEither<User> readUserWithUid({required String uid}) async {
    try {
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(usersCollectionNameString)
          .doc(uid)
          .get();

      final userDocumentData = documentSnapshot.data() as Map<String, dynamic>?;
      if (userDocumentData != null) {
        return Right(
          UserModel.toEntity(
            UserModel.fromMap(userDocumentData),
          ),
        );
      } else {
        return Left(Failure('No document found with the specified uid.'));
      }
    } catch (e) {
      return Left(Failure('An unexpected error occurred: $e'));
    }
  }

  @override
  StreamEither<User> watchUserWithUid() async* {
    try {
      final user = auth.FirebaseAuth.instance.currentUser;
      if (user == null) {

        yield Left(Failure('No current user founded'));
      }
      final DocumentReference userDocRef =
          firebaseFirestore.collection(usersCollectionNameString).doc(
                user!.uid,
              );
      yield* userDocRef.snapshots().map((snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          final data = snapshot.data() as Map<String, dynamic>?;
          final currentUserModel = UserModel.fromMap(data!);
          final userEntity = UserModel.toEntity(currentUserModel);
          return Right(userEntity);
        } else {
          return Left(
            Failure('Document not found.'),
          );
        }
      });
    } catch (exception) {
      yield Left(
        Failure(
          exception.toString(),
        ),
      );
    }
  }

  @override
  FutureEither<User> updateUserWithUid({required User updatedUser}) async {
    try {
      await firebaseFirestore
          .doc(updatedUser.uid)
          .update(UserModel.fromEntity(updatedUser).toMap());

      return Right(updatedUser);
    } catch (exception) {
      return Left(
        Failure('Something went wrong. Error code : ${exception.hashCode}'),
      );
    }
  }

  @override
  FutureUnit changeUsername({required String newUsername}) async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/changeUsername';
    final user = auth.FirebaseAuth.instance.currentUser;

    try {
      if (user == null) {
        return Left(Failure('Please sign in again.'));
      }
      final idToken = await user.getIdToken();
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
        return const Right(unit);
      } else if (response.statusCode == 400) {
        return Left(Failure(response.body));
      } else {
        return Left(Failure('Error occured while changing username.'));
      }
    } catch (e) {
      return Left(Failure('Error occured while changing username. $e'));
    }
  }

  @override
  FutureUnit refreshDeck() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/refreshMyDeck';
    final user = auth.FirebaseAuth.instance.currentUser;

    try {
      if (user == null) {
        return Left(Failure('Please sign in again.'));
      }
      final idToken = await user.getIdToken();
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode == 200) {
        return const Right(unit);
      } else if (response.statusCode == 400) {
        return Left(Failure(response.body));
      } else {
        return Left(Failure('Error occured while refreshing Deck.'));
      }
    } catch (e) {
      return Left(Failure('Error occured while refreshing Deck. $e'));
    }
  }

  @override
  FutureUnit deleteUser({required String uid}) async {
    try {
      await FirebaseFirestore.instance
          .collection(usersCollectionNameString)
          .doc(uid)
          .delete();
      return const Right(unit);
    } catch (e) {
      return Left(Failure('An unexpected error occurred: $e'));
    }
  }
}
