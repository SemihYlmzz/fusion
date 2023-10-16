class WinTheGameExceptions implements Exception {
  const WinTheGameExceptions({required this.message});
  final String message;

  static const winFailed = WinTheGameExceptions(
    message: 'Oyunu kazanılırken bir hata oluştu.',
  );
  static const unknown = WinTheGameExceptions(
    message: 'Oyunu kazanılırken bilinmeyen bir hata oluştu.',
  );
  static const empty = WinTheGameExceptions(message: '');
}
