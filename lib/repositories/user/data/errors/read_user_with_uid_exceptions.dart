class ReadUserWithUidExceptions implements Exception {
  const ReadUserWithUidExceptions({required this.message});
  final String message;

  static const unknown = ReadUserWithUidExceptions(
    message: 'Kullanıcı verisi okunurken beklenmeyen bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const empty = ReadUserWithUidExceptions(message: '');
}
