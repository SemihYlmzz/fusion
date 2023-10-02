import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fusion/core/errors/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

import '../models/delete_model.dart';
import 'delete_request_datasource.dart';

class DeleteRequestFields {
  static const scheduledDeleteDate = 'scheduledDeleteDate';
  static const uid = 'uid';
}

class DeleteRequestDataSourceFirebaseImpl implements DeleteRequestDatasource {
  final firebaseFirestore = FirebaseFirestore.instance;
  final deleteRequestsCollectionNameString = 'delete_requests';

  @override
  Future<DeleteRequestModel> createDeleteRequest() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/createDeleteRequest';
    final user = auth.FirebaseAuth.instance.currentUser;
    final manualScheduledDeleteDate = DateTime.now().add(
      const Duration(days: 30),
    );

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
        return DeleteRequestModel(
          scheduledDeleteDate: manualScheduledDeleteDate,
          uid: auth.FirebaseAuth.instance.currentUser!.uid,
        );
      }
      if (response.statusCode == 400) {
        throw ServerException(message: response.body);
      } else {
        throw ServerException(
          message:
              'Error occured while Deleting account. '
              'Error code:${response.statusCode}',
        );
      }
    } catch (e) {
      throw const ServerException(
        message: 'Error occured while Deleting account.',
      );
    }
  }

  @override
  Future<void> cancelDeleteRequest() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/cancelDeleteRequest';
    final user = auth.FirebaseAuth.instance.currentUser;

    try {
      if (user == null) {
        throw const ServerException(message: 'You must be signed in.');
      }
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw const ServerException(
          message: 'Error occured while canceling the Delete Request.',
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
              'Error occured while Canceling delete request. '
              'Error code:${response.statusCode}',
        );
      }
    } catch (e) {
      throw const ServerException(
        message: 'Error occured while Canceling Delete request.',
      );
    }
  }

  @override
  Future<DeleteRequestModel?> checkDeleteRequest({required String uid}) async {
    try {
      final deleteRequest = await firebaseFirestore
          .collection(deleteRequestsCollectionNameString)
          .doc(uid)
          .get();

      final deleteRequestData = deleteRequest.data();
      if (deleteRequestData == null) {
        return null;
      }
      return DeleteRequestModel.fromMap(deleteRequestData);
    } catch (e) {
      throw const ServerException(
        message: 'Error occured while checking delete request',
      );
    }
  }
}
