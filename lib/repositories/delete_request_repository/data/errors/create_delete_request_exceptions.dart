class CreateDeleteRequestExceptions implements Exception {
  const CreateDeleteRequestExceptions({required this.message});
  final String message;

  static const createFailed = CreateDeleteRequestExceptions(
    message: 'Silme işlemi başlatılamadı. Lütfen tekrar deneyin.',
  );
  static const unknown = CreateDeleteRequestExceptions(
    message: 'Silme işlemi başlatılırken bilinmeyen bir hata oluştu. '
        'Lütfen tekrar deneyin.',
  );
  static const empty = CreateDeleteRequestExceptions(message: '');
}
