part of 'audio_cubit.dart';

class AudioState extends Equatable {
  const AudioState({
    required this.isBackgroundSoundPlaying,
  });
  final bool isBackgroundSoundPlaying;

  AudioState copyWith({
    bool? isBackgroundSoundPlaying,
  }) {
    return AudioState(
      isBackgroundSoundPlaying:
          isBackgroundSoundPlaying ?? this.isBackgroundSoundPlaying,
    );
  }

  @override
  List<Object> get props => [isBackgroundSoundPlaying];
}
