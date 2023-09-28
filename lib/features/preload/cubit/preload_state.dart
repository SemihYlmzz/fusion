part of 'preload_cubit.dart';

class PreloadState extends Equatable {
  const PreloadState({
    required this.cachedImage,
    required this.cachedBgmSounds,
    required this.cachedSfxSounds,
  });
  final int cachedImage;
  final int cachedBgmSounds;
  final int cachedSfxSounds;

  PreloadState copyWith({
    int? cachedImage,
    int? cachedBgmSounds,
    int? cachedSfxSounds,
  }) {
    return PreloadState(
      cachedImage: cachedImage ?? this.cachedImage,
      cachedBgmSounds: cachedBgmSounds ?? this.cachedBgmSounds,
      cachedSfxSounds: cachedSfxSounds ?? this.cachedSfxSounds,
    );
  }

  @override
  List<Object> get props => [
        cachedImage,
        cachedBgmSounds,
        cachedSfxSounds,
      ];
}
