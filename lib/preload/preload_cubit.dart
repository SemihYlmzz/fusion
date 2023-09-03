import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'preload_state.dart';

class PreloadCubit extends Cubit<PreloadState> {
  PreloadCubit({
    required this.bgmAudioCache,
    required this.sfxAudioCache,
  }) : super(
          const PreloadState(
            cachedImage: 0,
            cachedBgmSounds: 0,
            cachedSfxSounds: 0,
          ),
        );
  final AudioCache bgmAudioCache;
  final AudioCache sfxAudioCache;

  Future<void> preloadImages(
    BuildContext context,
    List<String> imagePathList,
  ) async {
    for (final element in imagePathList) {
      if (context.mounted) {
        await precacheImage(
          AssetImage(element),
          context,
        );
        emit(state.copyWith(cachedImage: state.cachedImage + 1));
      }
    }
  }

  Future<void> preloadBgmSounds(
    List<String> bgmSoundsPathList,
  ) async {
    for (final element in bgmSoundsPathList) {
      await bgmAudioCache.load(element);

      emit(state.copyWith(cachedBgmSounds: bgmAudioCache.loadedFiles.length));
    }
  }

  Future<void> preloadSfxSounds(
    List<String> sfxSoundsPathList,
  ) async {
    for (final element in sfxSoundsPathList) {
      await sfxAudioCache.load(element);

      emit(state.copyWith(cachedSfxSounds: sfxAudioCache.loadedFiles.length));
    }
  }
}
