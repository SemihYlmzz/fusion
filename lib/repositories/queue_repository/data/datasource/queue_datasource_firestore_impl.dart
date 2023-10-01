import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions/exceptions.dart';
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
  Future<QueueModel> enterQueue() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/enterQueue';
    final user = auth.FirebaseAuth.instance.currentUser;

    try {
      if (user == null) {
        throw const ServerException(message: 'You must be signed in.');
      }
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw const ServerException(
          message: 'Error occured while deleting. Please try again.',
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
        return QueueModel(
          dateOfCreate: DateTime.now(),
          uid: user.uid,
        );
      }
      if (response.statusCode == 400) {
        throw ServerException(message: response.body);
      } else {
        throw ServerException(
          message:
              'Error occured while entering Queue. Error code:${response.statusCode}',
        );
      }
    } catch (e) {
      throw const ServerException(
        message: 'Error occured while Deleting account.',
      );
    }
  }

  @override
  Future<void> leaveQueue() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/leaveQueue';
    final user = auth.FirebaseAuth.instance.currentUser;

    try {
      if (user == null) {
        throw const ServerException(message: 'You must be signed in.');
      }
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw const ServerException(
          message: 'Error occured while deleting. Please try again.',
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
              'Error occured while leaving Queue. Error code:${response.statusCode}',
        );
      }
    } catch (e) {
      throw const ServerException(
        message: 'Error occured while Deleting account.',
      );
    }
  }

  @override
  Future<QueueModel?> checkQueue() async {
    try {
      final user = auth.FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw const ServerException(message: 'You must be signed in.');
      }
      final userQueueDoc = await firebaseFirestore
          .collection(queueCollectionNameString)
          .doc(user.uid)
          .get();
      if (!userQueueDoc.exists) {
        return null;
      }
      return QueueModel.fromMap(userQueueDoc.data()!);
    } catch (exception) {
      throw const ServerException(
        message: 'Error occured while checking Queue.',
      );
    }
  }
}
