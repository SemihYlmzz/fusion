part of 'audio_cubit.dart';

class AudioState extends Equatable {
  const AudioState({
    required this.isDevicePrefsConnected,
    required this.backgroundVolume,
    required this.generalVolume,
    required this.soundEffectsVolume,
    required this.dialogueVolume,
  });
  final bool isDevicePrefsConnected;
  final double backgroundVolume;
  final double generalVolume;
  final double soundEffectsVolume;
  final double dialogueVolume;

  AudioState copyWith({
    bool? isDevicePrefsConnected,
    double? backgroundVolume,
    double? generalVolume,
    double? soundEffectsVolume,
    double? dialogueVolume,
  }) {
    return AudioState(
      isDevicePrefsConnected:
          isDevicePrefsConnected ?? this.isDevicePrefsConnected,
      backgroundVolume: backgroundVolume ?? this.backgroundVolume,
      generalVolume: generalVolume ?? this.generalVolume,
      soundEffectsVolume: soundEffectsVolume ?? this.soundEffectsVolume,
      dialogueVolume: dialogueVolume ?? this.dialogueVolume,
    );
  }

  @override
  List<Object> get props => [
        isDevicePrefsConnected,
        backgroundVolume,
        generalVolume,
        soundEffectsVolume,
        dialogueVolume,
      ];
}
