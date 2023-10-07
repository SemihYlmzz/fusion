class ChangeUsernameExceptions implements Exception {
  const ChangeUsernameExceptions({required this.message});
  final String message;

  static const changeFailed = ChangeUsernameExceptions(
    message: 'İsim değiştirilirken bir hata oluştu. Lütfen tekrar deneyiniz.',
  );
  static const unknown = ChangeUsernameExceptions(
    message: 'İsim değiştirilirken beklenmeyen bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const empty = ChangeUsernameExceptions(message: '');
}
