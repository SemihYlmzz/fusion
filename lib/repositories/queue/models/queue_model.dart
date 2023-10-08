import 'package:equatable/equatable.dart';

class QueueModel extends Equatable {
  const QueueModel({
    required this.dateOfCreate,
    required this.uid,
  });
  factory QueueModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('uid') || !map.containsKey('dateOfCreate')) {
      throw Exception('Map data does not contain all keys');
    }
    return QueueModel(
      dateOfCreate: DateTime.fromMillisecondsSinceEpoch(
        map['dateOfCreate'] as int,
      ),
      uid: map['uid'] as String,
    );
  }

  final DateTime dateOfCreate;
  final String uid;

  QueueModel copyWith({
    DateTime? dateOfCreate,
    String? uid,
  }) {
    return QueueModel(
      dateOfCreate: dateOfCreate ?? this.dateOfCreate,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
        dateOfCreate,
        uid,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateOfCreate': dateOfCreate.millisecondsSinceEpoch,
      'uid': uid,
    };
  }
}
