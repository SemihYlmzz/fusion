import 'package:equatable/equatable.dart';

class Queue extends Equatable {
  const Queue({
    required this.dateOfCreate,
    required this.uid,
  });

  final DateTime dateOfCreate;
  final String uid;

  Queue copyWith({
    DateTime? dateOfCreate,
    String? uid,
  }) {
    return Queue(
      dateOfCreate: dateOfCreate ?? this.dateOfCreate,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [
        dateOfCreate,
        uid,
      ];
}
