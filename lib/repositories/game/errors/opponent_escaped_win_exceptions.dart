class OpponentEscapedWinExceptions implements Exception {
  const OpponentEscapedWinExceptions({required this.message});
  final String message;

  static const winFailed = OpponentEscapedWinExceptions(
    message: 'Oyunu sonlandırırken bir hata oluştu.',
  );
  static const unknown = OpponentEscapedWinExceptions(
    message: 'Oyunu sonlandırırken bilinmeyen bir hata oluştu.',
  );
  static const empty = OpponentEscapedWinExceptions(message: '');
}
