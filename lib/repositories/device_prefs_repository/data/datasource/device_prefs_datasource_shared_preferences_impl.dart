import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/device_prefs.dart';
import 'device_prefs_datasource.dart';

class DevicePrefsFields {
  static const generalSoundVolume = 'generalSoundVolume';
  static const backGroundSoundVolume = 'backGroundSoundVolume';
  static const soundEffectsSoundVolume = 'soundEffectsSoundVolume';
  static const dialogsSoundVolume = 'dialogsSoundVolume';
  static const isHapticsOn = 'isHapticsOn';
  static const language = 'language';
  static const isTermsAndConditionsAccepted = 'isTermsAndConditionsAccepted';
}

class DevicePrefsDataSourceSharedPreferencesImpl
    implements DevicePrefsDatasource {
  @override
  FutureEither<DevicePrefs> createDevicePrefs() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setDouble(DevicePrefsFields.generalSoundVolume, 0.7);
    await prefs.setDouble(DevicePrefsFields.backGroundSoundVolume, 0.7);
    await prefs.setDouble(DevicePrefsFields.soundEffectsSoundVolume, 0.7);
    await prefs.setDouble(DevicePrefsFields.dialogsSoundVolume, 0.7);
    await prefs.setBool(DevicePrefsFields.isHapticsOn, true);
    await prefs.setString(DevicePrefsFields.language, '');
    await prefs.setBool(DevicePrefsFields.isTermsAndConditionsAccepted, false);
    return const Right(DevicePrefs.empty);
  }

  @override
  FutureEither<DevicePrefs> readDevicePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return Right(
      DevicePrefs(
        generalSoundVolume:
            prefs.getDouble(DevicePrefsFields.generalSoundVolume) ??
                DevicePrefs.empty.generalSoundVolume,
        backGroundSoundVolume:
            prefs.getDouble(DevicePrefsFields.backGroundSoundVolume) ??
                DevicePrefs.empty.backGroundSoundVolume,
        soundEffectsSoundVolume:
            prefs.getDouble(DevicePrefsFields.soundEffectsSoundVolume) ??
                DevicePrefs.empty.soundEffectsSoundVolume,
        dialogsSoundVolume:
            prefs.getDouble(DevicePrefsFields.dialogsSoundVolume) ??
                DevicePrefs.empty.soundEffectsSoundVolume,
        isHapticsOn: prefs.getBool(DevicePrefsFields.isHapticsOn) ??
            DevicePrefs.empty.isHapticsOn,
        language: prefs.getString(DevicePrefsFields.language) ??
            DevicePrefs.empty.language,
        isTermsAndConditionsAccepted: prefs.getBool(
              DevicePrefsFields.isTermsAndConditionsAccepted,
            ) ??
            DevicePrefs.empty.isTermsAndConditionsAccepted,
      ),
    );
  }

  @override
  FutureEither<DevicePrefs> updateDevicePrefs({
    required DevicePrefs updatedDevicePrefs,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(
      DevicePrefsFields.generalSoundVolume,
      updatedDevicePrefs.generalSoundVolume,
    );
    await prefs.setDouble(
      DevicePrefsFields.backGroundSoundVolume,
      updatedDevicePrefs.backGroundSoundVolume,
    );
    await prefs.setDouble(
      DevicePrefsFields.soundEffectsSoundVolume,
      updatedDevicePrefs.soundEffectsSoundVolume,
    );
    await prefs.setDouble(
      DevicePrefsFields.dialogsSoundVolume,
      updatedDevicePrefs.dialogsSoundVolume,
    );
    await prefs.setBool(
      DevicePrefsFields.isHapticsOn,
      updatedDevicePrefs.isHapticsOn,
    );
    await prefs.setString(
      DevicePrefsFields.language,
      updatedDevicePrefs.language,
    );
    await prefs.setBool(
      DevicePrefsFields.isTermsAndConditionsAccepted,
      updatedDevicePrefs.isTermsAndConditionsAccepted,
    );
    return Right(updatedDevicePrefs);
  }
}
