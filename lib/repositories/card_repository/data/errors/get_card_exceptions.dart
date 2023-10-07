class GetCardExceptions implements Exception {
  const GetCardExceptions({required this.message});
  final String message;

  static const getFailed = GetCardExceptions(
    message: 'Kart bilgileri alınırken hata oluştu.',
  );
  static const unknown = GetCardExceptions(
    message: 'Kart bilgileri alınırken bilinmeyen bir hata oluştu.',
  );
  static const empty = GetCardExceptions(message: '');
}
