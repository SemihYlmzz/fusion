class CheckUserException implements Exception {
  const CheckUserException({required this.message});
  final String message;
  static const empty = CheckUserException(message: '');
}
