import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';

class DevicePrefsModel extends DevicePrefs {
  const DevicePrefsModel({
    required super.generalSoundVolume,
    required super.backGroundSoundVolume,
    required super.soundEffectsSoundVolume,
    required super.dialogsSoundVolume,
    required super.isHapticsOn,
    required super.language,
    required super.isTermsAndConditionsAccepted,
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

  // ignore: prefer_constructors_over_static_methods
  static DevicePrefsModel fromEntity(DevicePrefs devicePrefsEntity) {
    return DevicePrefsModel(
      generalSoundVolume: devicePrefsEntity.generalSoundVolume,
      backGroundSoundVolume: devicePrefsEntity.backGroundSoundVolume,
      soundEffectsSoundVolume: devicePrefsEntity.soundEffectsSoundVolume,
      dialogsSoundVolume: devicePrefsEntity.dialogsSoundVolume,
      isHapticsOn: devicePrefsEntity.isHapticsOn,
      language: devicePrefsEntity.language,
      isTermsAndConditionsAccepted:
          devicePrefsEntity.isTermsAndConditionsAccepted,
    );
  }

  static DevicePrefs toEntity(DevicePrefsModel devicePrefsModel) {
    return DevicePrefs(
      generalSoundVolume: devicePrefsModel.generalSoundVolume,
      backGroundSoundVolume: devicePrefsModel.backGroundSoundVolume,
      soundEffectsSoundVolume: devicePrefsModel.soundEffectsSoundVolume,
      dialogsSoundVolume: devicePrefsModel.dialogsSoundVolume,
      isHapticsOn: devicePrefsModel.isHapticsOn,
      language: devicePrefsModel.language,
      isTermsAndConditionsAccepted:
          devicePrefsModel.isTermsAndConditionsAccepted,
    );
  }
}
