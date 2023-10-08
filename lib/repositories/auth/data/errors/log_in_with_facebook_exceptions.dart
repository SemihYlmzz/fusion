class LogInWithFacebookExceptions implements Exception {
  const LogInWithFacebookExceptions({required this.message});
  final String message;

  static const logInFailed = LogInWithFacebookExceptions(
    message: 'Facebook ile Giriş yaparken bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const unknown = LogInWithFacebookExceptions(
    message: 'Facebook ile Giriş yaparken bilinmeyen bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const empty = LogInWithFacebookExceptions(message: '');
}
