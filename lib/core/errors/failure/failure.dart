import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Please check your internet connection and try again.',
  });
}

class NullResponseFailure extends Failure {
  const NullResponseFailure({required super.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}
class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}
class PlatformFailure extends Failure {
  const PlatformFailure({
    super.message = 'Current device platform does not supported.',
  });
}

class UserFailure extends Failure {
  const UserFailure({required super.message});
}
