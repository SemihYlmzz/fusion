import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/gen/assets.gen.dart';
import '../../login/view/view.dart';
import '../cubit/preload.dart';
import 'view.dart';

class PreloadScreen extends StatelessWidget {
  const PreloadScreen({super.key});
  static const String path = '/preload';
  static const String name = 'preload';

  static final List<String> _mustCachedImagesPathList = [
    Assets.images.fireCards.values[0].path,
    Assets.images.fireCards.values[1].path,
    Assets.images.fireCards.values[2].path,
    Assets.images.fireCards.values[3].path,
    Assets.images.fireCards.values[4].path,
    Assets.images.fireCards.values[5].path,
    Assets.images.fireCards.values[6].path,
    Assets.images.fireCards.values[7].path,
    Assets.images.fireCards.values[8].path,
    Assets.images.fireCards.values[9].path,
    Assets.images.waterCards.values[0].path,
    Assets.images.waterCards.values[1].path,
    Assets.images.waterCards.values[2].path,
    Assets.images.waterCards.values[3].path,
    Assets.images.waterCards.values[4].path,
    Assets.images.waterCards.values[5].path,
    Assets.images.waterCards.values[6].path,
    Assets.images.waterCards.values[7].path,
    Assets.images.waterCards.values[8].path,
    Assets.images.waterCards.values[9].path,
    Assets.images.earthCards.values[0].path,
    Assets.images.earthCards.values[1].path,
    Assets.images.earthCards.values[2].path,
    Assets.images.earthCards.values[3].path,
    Assets.images.earthCards.values[4].path,
    Assets.images.earthCards.values[5].path,
    Assets.images.earthCards.values[6].path,
    Assets.images.earthCards.values[7].path,
    Assets.images.earthCards.values[8].path,
    Assets.images.earthCards.values[9].path,
    Assets.images.airCards.values[0].path,
    Assets.images.airCards.values[1].path,
    Assets.images.airCards.values[2].path,
    Assets.images.airCards.values[3].path,
    Assets.images.airCards.values[4].path,
    Assets.images.airCards.values[5].path,
    Assets.images.airCards.values[6].path,
    Assets.images.airCards.values[7].path,
    Assets.images.airCards.values[8].path,
    Assets.images.airCards.values[9].path,
    Assets.images.borders.settingsBorderBottom.path,
    Assets.images.borders.settingsBorderTop.path,
    Assets.images.cardPreview.cardPower.path,
  ];
  static final List<String> _mustCachedSfxSoundsPathList = [
    Assets.music.sfx.playButtonSfx,
    Assets.music.sfx.settingsButtonSfx,
    Assets.music.sfx.refreshDeckButtonSfx,
  ];
  static final List<String> _mustCachedBgmSoundsPathList = [
    Assets.music.background.queueLoop,
    Assets.music.background.mainMenuLoop,
  ];

  @override
  Widget build(BuildContext context) {
    context.read<PreloadCubit>().preloadImages(
          context,
          _mustCachedImagesPathList,
        );
    context.read<PreloadCubit>().preloadSfxSounds(
          _mustCachedSfxSoundsPathList,
        );
    context.read<PreloadCubit>().preloadBgmSounds(
          _mustCachedBgmSoundsPathList,
        );
    final mustCachedAssetsLength = _mustCachedImagesPathList.length +
        _mustCachedSfxSoundsPathList.length +
        _mustCachedBgmSoundsPathList.length;

    return BlocBuilder<PreloadCubit, PreloadState>(
      builder: (context, preloadState) {
        final cachedAssets = preloadState.cachedImage +
            preloadState.cachedBgmSounds +
            preloadState.cachedSfxSounds;

        if (cachedAssets / mustCachedAssetsLength == 1) {
          context.goNamed(LoginScreen.name);
        }

        return PreloadView(
          value: (preloadState.cachedImage + preloadState.cachedBgmSounds) /
              (_mustCachedImagesPathList.length +
                  _mustCachedSfxSoundsPathList.length +
                  _mustCachedBgmSoundsPathList.length),
        );
      },
    );
  }
}
