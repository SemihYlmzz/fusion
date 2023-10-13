class SurrenderExceptions implements Exception {
  const SurrenderExceptions({required this.message});
  final String message;

  static const surrenderFailed = SurrenderExceptions(
    message: 'Teslim olma gerçekleştirilirken bir hata oluştu.',
  );
  static const unknown = SurrenderExceptions(
    message: 'Teslim olma gerçekleştirilirken bilinmeyen bir hata oluştu.',
  );
  static const empty = SurrenderExceptions(message: '');
}
