class ReadDevicePrefsExceptions implements Exception {
  const ReadDevicePrefsExceptions({required this.message});
  final String message;

  static const readFailed = ReadDevicePrefsExceptions(
    message: 'Cihaz hafızasındaki kayıtlı bilgileriniz okunamadı.',
  );
  static const unknown = ReadDevicePrefsExceptions(
    message: 'Bilinmeyen bir sebepten dolayı, '
        'Cihaz hafızasındaki kayıtlı bilgileriniz okunamadı.',
  );
  static const noData = ReadDevicePrefsExceptions(
    message: 'No device data founded.',
  );
  static const empty = ReadDevicePrefsExceptions(message: '');
}
