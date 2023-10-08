class LogInWithAppleExceptions implements Exception {
  const LogInWithAppleExceptions({required this.message});
  final String message;

  static const logInFailed = LogInWithAppleExceptions(
    message: 'Apple ile Giriş yaparken bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const unknown = LogInWithAppleExceptions(
    message: 'Apple ile Giriş yaparken bilinmeyen bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const empty = LogInWithAppleExceptions(message: '');
}
