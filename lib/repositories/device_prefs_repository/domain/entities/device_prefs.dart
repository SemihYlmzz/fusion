import 'package:equatable/equatable.dart';

class DevicePrefs extends Equatable {
  const DevicePrefs({
    required this.generalSoundVolume,
    required this.backGroundSoundVolume,
    required this.soundEffectsSoundVolume,
    required this.dialogsSoundVolume,
    required this.isHapticsOn,
    required this.language,
  });
  final double generalSoundVolume;
  final double backGroundSoundVolume;
  final double soundEffectsSoundVolume;
  final double dialogsSoundVolume;
  final bool isHapticsOn;
  final String language;
  static const empty = DevicePrefs(
    generalSoundVolume: 0.7,
    backGroundSoundVolume: 0.7,
    dialogsSoundVolume: 0.7,
    soundEffectsSoundVolume: 0.7,
    isHapticsOn: true,
    language: '',
  );

  DevicePrefs copyWith({
    double? generalSoundVolume,
    double? backGroundSoundVolume,
    double? soundEffectsSoundVolume,
    double? dialogsSoundVolume,
    bool? isHapticsOn,
    String? language,
  }) {
    return DevicePrefs(
      generalSoundVolume: generalSoundVolume ?? this.generalSoundVolume,
      backGroundSoundVolume:
          backGroundSoundVolume ?? this.backGroundSoundVolume,
      soundEffectsSoundVolume:
          soundEffectsSoundVolume ?? this.soundEffectsSoundVolume,
      dialogsSoundVolume: dialogsSoundVolume ?? this.dialogsSoundVolume,
      isHapticsOn: isHapticsOn ?? this.isHapticsOn,
      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props => [
        generalSoundVolume,
        backGroundSoundVolume,
        soundEffectsSoundVolume,
        dialogsSoundVolume,
        isHapticsOn,
        language,
      ];
}
