import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../l10n/app_localizations.dart';
import 'settings_bordered_button.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;
  static const String languageCodeDefault = 'df';
  static const String languageCodeEnglish = 'en';
  static const String languageCodeTurkish = 'tr';

  static const String languageDefault = 'Default';
  static const String languageEnglish = 'English';
  static const String languageTurkish = 'Türkçe';
  @override
  Widget build(BuildContext context) {
    return SettingsBorderedButton(
      buttonText: AppLocalizations.of(context).language,
      onTap: () => _showLanguageSelectionDialog(context, devicePrefs),
      buttonWidget: Text(
        AppLocalizations.of(context).currentLanguage,
      ),
    );
  }

  Future<void> _showLanguageSelectionDialog(
    BuildContext context,
    DevicePrefs currentDevicePrefs,
  ) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        HapticFeedback.mediumImpact();
        return AlertDialog(
          contentPadding: SharedPaddings.all8,
          content: Container(
            constraints: const BoxConstraints(
              maxHeight: 320,
            ),
            child: RawScrollbar(
              thumbVisibility: true,
              interactive: false,
              thumbColor: Colors.redAccent,
              radius: const Radius.circular(20),
              thickness: 5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildLanguageOption(
                      languageDefault,
                      currentDevicePrefs.language,
                      currentDevicePrefs.isHapticsOn,
                      () {
                        Navigator.of(context).pop();
                        context.read<DevicePrefsBloc>().add(
                              UpdateDevicePrefs(
                                currentDevicePrefs.copyWith(
                                  language: languageCodeDefault,
                                ),
                              ),
                            );
                      },
                    ),
                    const Divider(),

                    _buildLanguageOption(
                      languageEnglish,
                      currentDevicePrefs.language,
                      currentDevicePrefs.isHapticsOn,
                      () {
                        Navigator.of(context).pop();
                        context.read<DevicePrefsBloc>().add(
                              UpdateDevicePrefs(
                                currentDevicePrefs.copyWith(
                                  language: languageCodeEnglish,
                                ),
                              ),
                            );
                      },
                    ),
                    const Divider(),

                    _buildLanguageOption(
                      languageTurkish,
                      currentDevicePrefs.language,
                      currentDevicePrefs.isHapticsOn,
                      () {
                        Navigator.of(context).pop();
                        context.read<DevicePrefsBloc>().add(
                              UpdateDevicePrefs(
                                currentDevicePrefs.copyWith(
                                  language: languageCodeTurkish,
                                ),
                              ),
                            );
                      },
                    ),

                    // Diğer dilleri benzer şekilde ekleyebilirsiniz.
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
    String language,
    String selectedLanguage,
    bool isHapticsOn,
    VoidCallback onPressed,
  ) {
    return ListTile(
      title: Text(language),
      trailing: Localization.languageNameToCode[language] == selectedLanguage
          ? const Icon(
              Icons.check,
              color: Colors.white,
            )
          : null,
      onTap: () {
        if (isHapticsOn) {
          HapticFeedback.mediumImpact();
        }
        onPressed();
      },
    );
  }
}
