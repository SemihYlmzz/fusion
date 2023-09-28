import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../core/failure/failure.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/delete_request.dart';
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
  FutureEither<DeleteRequest> createDeleteRequest() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/createDeleteRequest';
    final user = auth.FirebaseAuth.instance.currentUser;
    final manualScheduledDeleteDate =
        DateTime.now().add(const Duration(days: 30));
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
          DeleteRequest(
            scheduledDeleteDate: manualScheduledDeleteDate,
            uid: auth.FirebaseAuth.instance.currentUser!.uid,
          ),
        );
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
  FutureUnit cancelDeleteRequest() async {
    const cloudFunctionUrl =
        'https://us-central1-fusion-development-8faa3.cloudfunctions.net/cancelDeleteRequest';
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
        return Left(Failure('Error occured while changing username.'));
      }
    } catch (e) {
      return Left(Failure('Error occured while changing username. $e'));
    }
  }

  @override
  FutureEither<DeleteRequest> checkDeleteRequest({required String uid}) async {
    try {
      final deleteRequest = await firebaseFirestore
          .collection(deleteRequestsCollectionNameString)
          .doc(uid)
          .get();
      final deleteRequestData = deleteRequest.data();
      if (deleteRequestData == null) {
        return Left(Failure('No Delete Request Data'));
      }
      return Right(
        DeleteRequestModel.toEntity(
          DeleteRequestModel.fromMap(deleteRequestData),
        ),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
