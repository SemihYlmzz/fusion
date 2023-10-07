class UpdateDevicePrefsExceptions implements Exception {
  const UpdateDevicePrefsExceptions({required this.message});
  final String message;

  static const updateFailed = UpdateDevicePrefsExceptions(
    message: 'Verileriniz kaydedilemedi. Lütfen tekrar deniyin.',
  );
  static const unknown = UpdateDevicePrefsExceptions(
    message: 'Verileriniz bilinmeyen bir sebepten dolayı kaydedilemedi. '
        'Lütfen tekrar deniyin.',
  );
  static const empty = UpdateDevicePrefsExceptions(message: '');
}
