part of 'ad_cubit.dart';

class AdState extends Equatable {
  const AdState({
    required this.isLoadingAd,
    this.errorMessage,
    this.rewardedAd,
  });
  final String? errorMessage;
  final RewardedAd? rewardedAd;
  final bool isLoadingAd;

  AdState copyWith({
    bool? isLoadingAd,
    String? errorMessage,
    RewardedAd? rewardedAd,
  }) {
    return AdState(
      isLoadingAd: isLoadingAd ?? this.isLoadingAd,
      errorMessage: errorMessage ?? this.errorMessage,
      rewardedAd: rewardedAd ?? this.rewardedAd,
    );
  }

  @override
  List<Object?> get props => [
        isLoadingAd,
        errorMessage,
        rewardedAd,
      ];
}
