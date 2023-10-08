import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:http/http.dart' as http;

import '../delete_request_datasource.dart';
import '../errors/errors.dart';
import '../models/delete_request_model.dart';

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
        throw CreateDeleteRequestExceptions.createFailed;
      }
      final idToken = await user.getIdToken();
      if (idToken == null) {
        throw CreateDeleteRequestExceptions.createFailed;
      }
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode != 200) {
        throw CreateDeleteRequestExceptions.createFailed;
      }
      return DeleteRequestModel(
        scheduledDeleteDate: manualScheduledDeleteDate,
        uid: auth.FirebaseAuth.instance.currentUser!.uid,
      );
    } catch (e) {
      if (e is CreateDeleteRequestExceptions) {
        rethrow;
      }
      throw CreateDeleteRequestExceptions.unknown;
    }
  }
}
