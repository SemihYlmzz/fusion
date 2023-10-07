 final class UnknownException implements Exception {
   const UnknownException({required this.message});
   final String message;
 }

 final class NullResponseException implements Exception {
   const NullResponseException({required this.message});
   final String message;
 }

final class ServerException implements Exception {
  const ServerException({required this.message});
  final String message;
}
final class CacheException implements Exception {
  const CacheException({required this.message});
  final String message;
}

final class NetworkException implements Exception {
  const NetworkException();
}

class ValuelessException implements Exception {
  const ValuelessException();
}

// final class UserException implements Exception {
//   const UserException({required this.message});
//   final String message;
// }
