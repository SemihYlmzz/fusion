import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ad_state.dart';

class AdCubit extends Cubit<AdState> {
  AdCubit() : super(const AdState(isLoadingAd: false));

  static const _rewardedAdUnitId = 'ca-app-pub-3940256099942544/5224354917';

  Future<void> loadAndShowRewardedAd(
    VoidCallback onUserEarnedReward,
  ) async {
    emit(const AdState(isLoadingAd: true));

    await RewardedAd.load(
      adUnitId: _rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdFailedToLoad: (LoadAdError error) {
          emit(
            state.copyWith(
              isLoadingAd: false,
              errorMessage: error.message,
              retryLoadAdDate: DateTime.now().add(const Duration(seconds: 30)),
            ),
          );
        },
        onAdLoaded: (RewardedAd ad) async {
          await ad.show(
            onUserEarnedReward: (
              AdWithoutView ad,
              RewardItem rewardItem,
            ) async {
              onUserEarnedReward.call();
              emit(state.copyWith(isLoadingAd: false));
              return;
            },
          );
        },
      ),
    );
  }

  void clearErrorMessage() {
    emit(const AdState(isLoadingAd: false));
  }
}
