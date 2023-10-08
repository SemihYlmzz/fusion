class LogOutExceptions implements Exception {
  const LogOutExceptions({required this.message});
  final String message;

  static const unknown = LogOutExceptions(
    message: 'Çıkış yaparken bir hata oluştu. Lütfen tekrar deneyin.',
  );
  static const empty = LogOutExceptions(message: '');
}
