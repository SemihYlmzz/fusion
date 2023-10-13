class WatchGameWithGameIdExceptions implements Exception {
  const WatchGameWithGameIdExceptions({required this.message});
  final String message;

  static const watchFailed = WatchGameWithGameIdExceptions(
    message: 'Oyun verileri alınırken bir hata oluştu.',
  );
  static const unknown = WatchGameWithGameIdExceptions(
    message: 'Oyun verileri alınırken beklenmeyen bir hata oluştu.',
  );
  static const empty = WatchGameWithGameIdExceptions(message: '');
}
