class CheckQueueExceptions implements Exception {
  const CheckQueueExceptions({required this.message});
  final String message;

  static const empty = CheckQueueExceptions(message: '');
}
