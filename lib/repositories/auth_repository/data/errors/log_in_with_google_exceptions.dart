class LogInWithGoogleExceptions implements Exception {
  const LogInWithGoogleExceptions({required this.message});
  final String message;

  static const logInFailed = LogInWithGoogleExceptions(
    message: 'Google ile Giriş yaparken bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const unknown = LogInWithGoogleExceptions(
    message: 'Google ile Giriş yaparken bilinmeyen bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const empty = LogInWithGoogleExceptions(message: '');
}
