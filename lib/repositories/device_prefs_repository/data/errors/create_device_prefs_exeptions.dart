class CreateDevicePrefsExceptions implements Exception {
  const CreateDevicePrefsExceptions({required this.message});
  final String message;

  static const createFailed = CreateDevicePrefsExceptions(
    message: 'Kişisel verilerini saklarken bir hata oluştu.',
  );
  static const unknown = CreateDevicePrefsExceptions(
    message: 'Kişisel verilerini saklarken bilinmeyen bir hata oluştu',
  );
  static const empty = CreateDevicePrefsExceptions(message: '');
}
