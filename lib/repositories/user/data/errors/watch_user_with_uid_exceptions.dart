class WatchUserWithUidExceptions implements Exception {
  const WatchUserWithUidExceptions({required this.message});
  final String message;

  static const watchFailed = WatchUserWithUidExceptions(
    message: 'Kullanıcı verileri okunamadı.',
  );
  static const unknown = WatchUserWithUidExceptions(
    message: 'Bilinmeyen bir sebepten ötürü, '
        'kullanıcı verileri okunamadı.',
  );
  static const empty = WatchUserWithUidExceptions(message: '');
}
