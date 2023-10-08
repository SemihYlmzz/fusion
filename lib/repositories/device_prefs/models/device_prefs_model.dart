import 'package:equatable/equatable.dart';

class DevicePrefsModel extends Equatable {
  const DevicePrefsModel({
    required this.generalSoundVolume,
    required this.backGroundSoundVolume,
    required this.soundEffectsSoundVolume,
    required this.dialogsSoundVolume,
    required this.isHapticsOn,
    required this.language,
    required this.isTermsAndConditionsAccepted,
  });

  factory DevicePrefsModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('generalSoundVolume') ||
        !map.containsKey('backGroundSoundVolume') ||
        !map.containsKey('soundEffectsSoundVolume') ||
        !map.containsKey('dialogsSoundVolume') ||
        !map.containsKey('isHapticsOn') ||
        !map.containsKey('language') ||
        !map.containsKey('isTermsAndConditionsAccepted')) {
      throw Exception('Map data does not contain all keys');
    }
    return DevicePrefsModel(
      generalSoundVolume: map['generalSoundVolume'] as double,
      backGroundSoundVolume: map['backGroundSoundVolume'] as double,
      soundEffectsSoundVolume: map['soundEffectsSoundVolume'] as double,
      dialogsSoundVolume: map['dialogsSoundVolume'] as double,
      isHapticsOn: map['isHapticsOn'] as bool,
      language: map['language'] as String,
      isTermsAndConditionsAccepted: map['isTermsAndConditionsAccepted'] as bool,
    );
  }
  final double generalSoundVolume;
  final double backGroundSoundVolume;
  final double soundEffectsSoundVolume;
  final double dialogsSoundVolume;
  final bool isHapticsOn;
  final String language;
  final bool isTermsAndConditionsAccepted;

  static const empty = DevicePrefsModel(
    generalSoundVolume: 0.7,
    backGroundSoundVolume: 0.7,
    dialogsSoundVolume: 0.7,
    soundEffectsSoundVolume: 0.7,
    isHapticsOn: true,
    language: '',
    isTermsAndConditionsAccepted: false,
  );

  DevicePrefsModel copyWith({
    double? generalSoundVolume,
    double? backGroundSoundVolume,
    double? soundEffectsSoundVolume,
    double? dialogsSoundVolume,
    bool? isHapticsOn,
    String? language,
    bool? isTermsAndConditionsAccepted,
  }) {
    return DevicePrefsModel(
      generalSoundVolume: generalSoundVolume ?? this.generalSoundVolume,
      backGroundSoundVolume:
          backGroundSoundVolume ?? this.backGroundSoundVolume,
      soundEffectsSoundVolume:
          soundEffectsSoundVolume ?? this.soundEffectsSoundVolume,
      dialogsSoundVolume: dialogsSoundVolume ?? this.dialogsSoundVolume,
      isHapticsOn: isHapticsOn ?? this.isHapticsOn,
      language: language ?? this.language,
      isTermsAndConditionsAccepted:
          isTermsAndConditionsAccepted ?? this.isTermsAndConditionsAccepted,
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
        isTermsAndConditionsAccepted,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'generalSoundVolume': generalSoundVolume,
      'backGroundSoundVolume': backGroundSoundVolume,
      'soundEffectsSoundVolume': soundEffectsSoundVolume,
      'dialogsSoundVolume': dialogsSoundVolume,
      'isHapticsOn': isHapticsOn,
      'language': language,
      'isTermsAndConditionsAccepted': isTermsAndConditionsAccepted,
    };
  }
}
