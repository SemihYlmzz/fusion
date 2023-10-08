import '../../domain/entities/delete_request.dart';

class DeleteRequestModel extends DeleteRequest {
  const DeleteRequestModel({
    required super.scheduledDeleteDate,
    required super.uid,
  });
  factory DeleteRequestModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('scheduledDeleteDate') || !map.containsKey('uid')) {
      throw Exception('Map data does not contain all keys');
    }
    return DeleteRequestModel(
      scheduledDeleteDate: DateTime.fromMillisecondsSinceEpoch(
        map['scheduledDeleteDate'] as int,
      ),
      uid: map['uid'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scheduledDeleteDate': scheduledDeleteDate.millisecondsSinceEpoch,
      'uid': uid,
    };
  }

  // ignore: prefer_constructors_over_static_methods
  static DeleteRequestModel fromEntity(DeleteRequest userEntity) {
    return DeleteRequestModel(
      scheduledDeleteDate: userEntity.scheduledDeleteDate,
      uid: userEntity.uid,
    );
  }

  static DeleteRequest toEntity(DeleteRequestModel userModel) {
    return DeleteRequest(
      scheduledDeleteDate: userModel.scheduledDeleteDate,
      uid: userModel.uid,
    );
  }
}
