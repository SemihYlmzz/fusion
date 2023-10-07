import 'package:fusion/repositories/delete_request_repository/data/errors/errors.dart';
import 'package:fusion/repositories/device_prefs_repository/data/errors/read_device_prefs_exceptions.dart';
import 'package:fusion/repositories/device_prefs_repository/data/errors/update_device_prefs_exceptions.dart';
import 'package:fusion/repositories/device_prefs_repository/data/models/device_prefs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<DevicePrefsModel> createDevicePrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(DevicePrefsFields.generalSoundVolume, 0.7);
      await prefs.setDouble(DevicePrefsFields.backGroundSoundVolume, 0.7);
      await prefs.setDouble(DevicePrefsFields.soundEffectsSoundVolume, 0.7);
      await prefs.setDouble(DevicePrefsFields.dialogsSoundVolume, 0.7);
      await prefs.setBool(DevicePrefsFields.isHapticsOn, true);
      await prefs.setString(DevicePrefsFields.language, '');
      await prefs.setBool(
        DevicePrefsFields.isTermsAndConditionsAccepted,
        false,
      );
      return const DevicePrefsModel(
        generalSoundVolume: 0.7,
        backGroundSoundVolume: 0.7,
        soundEffectsSoundVolume: 0.7,
        dialogsSoundVolume: 0.7,
        isHapticsOn: true,
        language: '',
        isTermsAndConditionsAccepted: false,
      );
    } catch (exception) {
      throw CreateDeleteRequestExceptions.unknown;
    }
  }

  @override
  Future<DevicePrefsModel> readDevicePrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final generalSoundVolume =
          prefs.getDouble(DevicePrefsFields.generalSoundVolume);
      final backGroundSoundVolume =
          prefs.getDouble(DevicePrefsFields.backGroundSoundVolume);
      final soundEffectsSoundVolume =
          prefs.getDouble(DevicePrefsFields.soundEffectsSoundVolume);
      final dialogsSoundVolume =
          prefs.getDouble(DevicePrefsFields.dialogsSoundVolume);
      final isHapticsOn = prefs.getBool(DevicePrefsFields.isHapticsOn);
      final language = prefs.getString(DevicePrefsFields.language);
      final isTermsAndConditionsAccepted = prefs.getBool(
        DevicePrefsFields.isTermsAndConditionsAccepted,
      );
      if (generalSoundVolume == null ||
          backGroundSoundVolume == null ||
          soundEffectsSoundVolume == null ||
          dialogsSoundVolume == null ||
          isHapticsOn == null ||
          language == null ||
          isTermsAndConditionsAccepted == null) {
        throw ReadDevicePrefsExceptions.readFailed;
      }

      return DevicePrefsModel(
        generalSoundVolume: generalSoundVolume,
        backGroundSoundVolume: backGroundSoundVolume,
        soundEffectsSoundVolume: soundEffectsSoundVolume,
        dialogsSoundVolume: dialogsSoundVolume,
        isHapticsOn: isHapticsOn,
        language: language,
        isTermsAndConditionsAccepted: isTermsAndConditionsAccepted,
      );
    } catch (e) {
      if (e is ReadDevicePrefsExceptions) {
        rethrow;
      }
      throw ReadDevicePrefsExceptions.unknown;
    }
  }

  @override
  Future<DevicePrefsModel> updateDevicePrefs({
    required DevicePrefs updatedDevicePrefs,
  }) async {
    try {
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
      return DevicePrefsModel.fromEntity(updatedDevicePrefs);
    } catch (exception) {
      throw UpdateDevicePrefsExceptions.unknown;
    }
  }
}
