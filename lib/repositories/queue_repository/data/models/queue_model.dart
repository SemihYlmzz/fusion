import '../../domain/entities/queue.dart';

class QueueModel extends Queue {
  const QueueModel({
    required super.dateOfCreate,
    required super.uid,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateOfCreate': dateOfCreate.millisecondsSinceEpoch,
      'uid': uid,
    };
  }

  // ignore: prefer_constructors_over_static_methods
  static QueueModel fromEntity(Queue queueEntity) {
    return QueueModel(
      dateOfCreate: queueEntity.dateOfCreate,
      uid: queueEntity.uid,
    );
  }

  static Queue toEntity(QueueModel queueModel) {
    return Queue(
      dateOfCreate: queueModel.dateOfCreate,
      uid: queueModel.uid,
    );
  }
}
