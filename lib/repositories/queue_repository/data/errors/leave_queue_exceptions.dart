class LeaveQueueExceptions implements Exception {
  const LeaveQueueExceptions({required this.message});
  final String message;

  static const leaveFailed = LeaveQueueExceptions(
    message: 'Sıradan çıkarken bir hata oluştu. Lütfen tekrar deneyiniz.',
  );
  static const unknown = LeaveQueueExceptions(
    message: 'Sıradan çıkarken beklenmeyen bir hata oluştu. '
        'Lütfen tekrar deneyiniz.',
  );
  static const empty = LeaveQueueExceptions(message: '');
}
