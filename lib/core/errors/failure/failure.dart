import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message});
  final String message;
  static const network = Failure(
    message: 'Please check your internet connection and try again.',
  );
  @override
  List<Object?> get props => [message];
}
