part of 'audio_cubit.dart';

class AudioState extends Equatable {
  const AudioState({
   
    required this.backgroundVolume,
    required this.generalVolume,
    required this.soundEffectsVolume,
    required this.dialogueVolume,
  });
  final double backgroundVolume;
  final double generalVolume;
  final double soundEffectsVolume;
  final double dialogueVolume;

  AudioState copyWith({
    bool? isBackgroundSoundPlaying,
    double? backgroundVolume,
    double? generalVolume,
    double? soundEffectsVolume,
    double? dialogueVolume,
  }) {
    return AudioState(
 
      backgroundVolume: backgroundVolume ?? this.backgroundVolume,
      generalVolume: generalVolume ?? this.generalVolume,
      soundEffectsVolume: soundEffectsVolume ?? this.soundEffectsVolume,
      dialogueVolume: dialogueVolume ?? this.dialogueVolume,
    );
  }

  @override
  List<Object> get props => [
        backgroundVolume,
        generalVolume,
        soundEffectsVolume,
        dialogueVolume,
      ];
}
