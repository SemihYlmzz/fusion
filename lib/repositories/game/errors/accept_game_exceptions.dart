class AcceptGameExceptions implements Exception {
  const AcceptGameExceptions({required this.message});
  final String message;

  static const acceptFailed = AcceptGameExceptions(
    message: 'Oyuna katılırken bir hata oluştu.',
  );
  static const unknown = AcceptGameExceptions(
    message: 'Oyuna katılırken bilinmeyen bir hata oluştu.',
  );
  static const empty = AcceptGameExceptions(message: '');
}
