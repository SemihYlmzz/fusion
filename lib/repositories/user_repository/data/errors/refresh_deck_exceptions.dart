class RefreshDeckExceptions implements Exception {
  const RefreshDeckExceptions({required this.message});
  final String message;

  static const refreshFailed = RefreshDeckExceptions(
    message: 'Deste yenilenirken bir hata oluştu. Lütfen tekrar deneyiniz.',
  );
  static const unknown = RefreshDeckExceptions(
    message: 'Deste yenilenirken beklenmeyen bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const empty = RefreshDeckExceptions(message: '');
}
