import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ad_state.dart';

class AdCubit extends Cubit<AdState> {
  AdCubit() : super(const AdState(isLoadingAd: false));

  static const _rewardedAdUnitId = 'ca-app-pub-3940256099942544/5224354917';

  Future<void> onLoadRewardedAdRequested() async {
    emit(const AdState(isLoadingAd: true));

    await RewardedAd.load(
      adUnitId: _rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdFailedToLoad: (LoadAdError error) {
          emit(AdState(isLoadingAd: false, errorMessage: error.message));
        },
        onAdLoaded: (RewardedAd ad) async {
          emit(AdState(isLoadingAd: false, rewardedAd: ad));
        },
      ),
    );
  }

  Future<void> onShowRewardedAdRequested(
    VoidCallback onUserEarnedReward,
  ) async {
    await state.rewardedAd?.show(
      onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) async {
        onUserEarnedReward.call();
        emit(const AdState(isLoadingAd: false));
        return;
      },
    );
    await onLoadRewardedAdRequested();
  }
}
