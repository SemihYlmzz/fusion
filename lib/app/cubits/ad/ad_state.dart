part of 'ad_cubit.dart';

class AdState extends Equatable {
  const AdState({
    required this.isLoadingAd,
    this.errorMessage,
    this.retryLoadAdDate,
  });
  final String? errorMessage;
  final bool isLoadingAd;
  final DateTime? retryLoadAdDate;

  AdState copyWith({
    bool? isLoadingAd,
    String? errorMessage,
    DateTime? retryLoadAdDate,
  }) {
    return AdState(
      isLoadingAd: isLoadingAd ?? this.isLoadingAd,
      errorMessage: errorMessage ?? this.errorMessage,
      retryLoadAdDate: retryLoadAdDate ?? this.retryLoadAdDate,
    );
  }

  @override
  List<Object?> get props => [
        isLoadingAd,
        errorMessage,
        retryLoadAdDate,
      ];
}
