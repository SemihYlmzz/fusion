class EnterQueueExceptions implements Exception {
  const EnterQueueExceptions({required this.message});
  final String message;

  static const enterFailed = EnterQueueExceptions(
    message: 'Sıraya girerken bir hata oluştu. Lütfen tekrar deneyiniz.',
  );
  static const unknown = EnterQueueExceptions(
    message: 'Sıraya girerken beklenmeyen bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const empty = EnterQueueExceptions(message: '');
}
