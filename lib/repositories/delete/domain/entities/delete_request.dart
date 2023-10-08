import 'package:equatable/equatable.dart';

class DeleteRequest extends Equatable {
  const DeleteRequest({
    required this.scheduledDeleteDate,
    required this.uid,
  });

  final DateTime scheduledDeleteDate;
  final String uid;

  DeleteRequest copyWith({
    DateTime? scheduledDeleteDate,
    String? uid,
  }) {
    return DeleteRequest(
      scheduledDeleteDate: scheduledDeleteDate ?? this.scheduledDeleteDate,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
        scheduledDeleteDate,
        uid,
      ];
}
