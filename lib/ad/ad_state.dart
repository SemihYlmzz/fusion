part of 'ad_cubit.dart';

class AdState extends Equatable {
  const AdState({
    required this.isLoadingAd,
    this.errorMessage,
    this.rewardedAd,
    this.retryLoadAdDate,
  });
  final String? errorMessage;
  final RewardedAd? rewardedAd;
  final bool isLoadingAd;
  final DateTime? retryLoadAdDate;

  AdState copyWith({
    bool? isLoadingAd,
    String? errorMessage,
    RewardedAd? rewardedAd,
    DateTime? retryLoadAdDate,
  }) {
    return AdState(
      isLoadingAd: isLoadingAd ?? this.isLoadingAd,
      errorMessage: errorMessage ?? this.errorMessage,
      rewardedAd: rewardedAd ?? this.rewardedAd,
      retryLoadAdDate: retryLoadAdDate ?? this.retryLoadAdDate,
    );
  }

  @override
  List<Object?> get props => [
        isLoadingAd,
        errorMessage,
        rewardedAd,
        retryLoadAdDate,
      ];
}
