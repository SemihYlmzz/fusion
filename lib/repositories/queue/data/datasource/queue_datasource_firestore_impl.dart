import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fusion/repositories/queue/data/errors/errors.dart';
import 'package:http/http.dart' as http;

import '../models/queue_model.dart';
import 'queue_datasource.dart';

class QueueFields {
  static const dateOfCreate = 'dateOfCreate';
  static const uid = 'uid';
}

class QueueDataSourceFirebaseImpl implements QueueDatasource {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final queueCollectionNameString = 'queue';
  final _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  Future<QueueModel> enterQueue() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/enterNormalQueue';
    final user = _firebaseAuth.currentUser;
    try {
      if (user == null) {
        throw EnterQueueExceptions.enterFailed;
      }
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw EnterQueueExceptions.enterFailed;
      }
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode != 200) {
        throw EnterQueueExceptions.enterFailed;
      }
      return QueueModel(
        dateOfCreate: DateTime.now(),
        uid: user.uid,
      );
    } catch (e) {
      if (e is EnterQueueExceptions) {
        rethrow;
      }
      throw EnterQueueExceptions.unknown;
    }
  }

  @override
  Future<void> leaveQueue() async {
    final user = _firebaseAuth.currentUser;

    try {
      if (user == null) {
        throw LeaveQueueExceptions.leaveFailed;
      }

      await _firebaseFirestore
          .collection(queueCollectionNameString)
          .doc(user.uid)
          .delete();
    } catch (e) {
      if (e is CheckQueueExceptions) {
        rethrow;
      }
      throw LeaveQueueExceptions.unknown;
    }
  }

  @override
  Future<QueueModel?> checkQueue() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw CheckQueueExceptions.empty;
      }
      final userQueueDoc = await _firebaseFirestore
          .collection(queueCollectionNameString)
          .doc(user.uid)
          .get();
      if (!userQueueDoc.exists) {
        return null;
      }
      return QueueModel.fromMap(userQueueDoc.data()!);
    } catch (exception) {
      throw CheckQueueExceptions.empty;
    }
  }
}
