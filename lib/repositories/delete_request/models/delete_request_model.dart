import 'package:equatable/equatable.dart';


class DeleteRequestModel extends Equatable {
  const DeleteRequestModel({
    required this.scheduledDeleteDate,
    required this.uid,
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

  final DateTime scheduledDeleteDate;
  final String uid;

  DeleteRequestModel copyWith({
    DateTime? scheduledDeleteDate,
    String? uid,
  }) {
    return DeleteRequestModel(
      scheduledDeleteDate: scheduledDeleteDate ?? this.scheduledDeleteDate,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
        scheduledDeleteDate,
        uid,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scheduledDeleteDate': scheduledDeleteDate.millisecondsSinceEpoch,
      'uid': uid,
    };
  }
}
