import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../core/failure/failure.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/queue.dart';
import '../models/queue_model.dart';
import 'queue_datasource.dart';

class QueueFields {
  static const dateOfCreate = 'dateOfCreate';
  static const uid = 'uid';
}

class QueueDataSourceFirebaseImpl implements QueueDatasource {
  final firebaseFirestore = FirebaseFirestore.instance;
  final queueCollectionNameString = 'queue';

  @override
  FutureEither<Queue> enterQueue() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/enterQueue';
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
        return Right(
          Queue(
            dateOfCreate: DateTime.now(),
            uid: user.uid,
          ),
        );
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
  FutureUnit leaveQueue() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/leaveQueue';
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
  FutureEither<Queue> checkQueue() async {
    try {
      final user = auth.FirebaseAuth.instance.currentUser;
      if (user == null) {
        return Left(Failure('Please sign in again.'));
      }
      final userQueueDoc = await firebaseFirestore
          .collection(queueCollectionNameString)
          .doc(user.uid)
          .get();
      if (!userQueueDoc.exists) {
        return Left(Failure('No queue document.'));
      }
      return Right(
        QueueModel.toEntity(
          QueueModel.fromMap(userQueueDoc.data()!),
        ),
      );
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }
}
