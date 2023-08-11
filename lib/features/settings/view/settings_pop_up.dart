import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../config/style/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';
import '../widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    required this.generalVolumeLevel,
    required this.musicVolumeLevel,
    required this.soundEffectVolumeLevel,
    required this.dialogueVolumeLevel,
    required this.isHapticsOn,
    super.key,
  });
  static const String path = '/settings';
  static const String name = 'settings';

  final double generalVolumeLevel;
  final double musicVolumeLevel;
  final double soundEffectVolumeLevel;
  final double dialogueVolumeLevel;
  final bool isHapticsOn;

  static const double settingsBoxWidth = 320;
  static const double settingsCardWidth = 300;
  static const double settingsBoxHeight = 600;
  static const double settingsCardHeight = 570;
  @override
  Widget build(BuildContext context) {
    return ClosableAnimatedScaffold(
      child: SizedBox(
        width: settingsBoxWidth,
        height: settingsBoxHeight,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: settingsCardWidth,
                height: settingsCardHeight,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: SharedBorderRadius.circular12,
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.orange,
                        AppColors.pink,
                      ],
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SettingsText(),
                    Expanded(
                      child: RawScrollbar(
                        thumbVisibility: true,
                        interactive: false,
                        thumbColor: Colors.redAccent,
                        radius: const Radius.circular(20),
                        thickness: 5,
                        child: BaseColumn(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Column(
                              children: [
                                SettingsVolumeSlider(
                                  volumeLevel: generalVolumeLevel,
                                  volumeText:
                                      AppLocalizations.of(context).general,
                                ),
                                SettingsVolumeSlider(
                                  volumeLevel: musicVolumeLevel,
                                  volumeText: AppLocalizations.of(context)
                                      .backgroundMusic,
                                ),
                                SettingsVolumeSlider(
                                  volumeText:
                                      AppLocalizations.of(context).soundEffects,
                                  volumeLevel: soundEffectVolumeLevel,
                                ),
                                SettingsVolumeSlider(
                                  volumeText:
                                      AppLocalizations.of(context).dialogues,
                                  volumeLevel: dialogueVolumeLevel,
                                ),
                              ],
                            ),
                            SettingsBorderedButton(
                              buttonText: AppLocalizations.of(context).haptics,
                              buttonWidget: StatefulBuilder(
                                builder: (context, setstate) {
                                  return Switch.adaptive(
                                    value: isHapticsOn,
                                    onChanged: (newValue) {
                                      setstate(() {});
                                    },
                                  );
                                },
                              ),
                            ),
                            SettingsBorderedButton(
                              buttonText: AppLocalizations.of(context).language,
                              onTap: () =>
                                  _showLanguageSelectionDialog(context),
                              buttonWidget: Text(
                                AppLocalizations.of(context).defaultText,
                              ),
                            ),
                            SettingsBorderedButton(
                              buttonText: AppLocalizations.of(context).username,
                              buttonWidget: const Text('CL4Y'),
                            ),
                            SettingsBorderedButton(
                              buttonText: AppLocalizations.of(context).account,
                              buttonWidget: const Text('Google'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      const AuthLogoutRequested(),
                                    );
                              },
                              child: Text(
                                AppLocalizations.of(context).signOut,
                              ),
                            ),
                            SettingsThickButton(
                              buttonText:
                                  AppLocalizations.of(context).reportABug,
                            ),
                            SettingsThickButton(
                              buttonText:
                                  AppLocalizations.of(context).sendUsAMail,
                            ),
                            SettingsThickButton(
                              buttonText: AppLocalizations.of(context).privacy,
                            ),
                            SettingsThickButton(
                              buttonText:
                                  AppLocalizations.of(context).termsOfService,
                            ),
                            SettingsThickButton(
                              buttonText: AppLocalizations.of(context).credits,
                            ),
                            SettingsThickButton(
                              buttonText:
                                  AppLocalizations.of(context).deleteAccount,
                            ),
                            const SizedBox(height: 12),
                            const Text('v1.0.0'),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: SettingsCloseButton(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showLanguageSelectionDialog(BuildContext context) async {
    final selectedLanguage = AppLocalizations.of(context).defaultText;

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
                      AppLocalizations.of(context).defaultText,
                      selectedLanguage,
                      Navigator.of(context).pop,
                    ),
                    const Divider(),

                    _buildLanguageOption(
                      'English',
                      selectedLanguage,
                      Navigator.of(context).pop,
                    ),
                    const Divider(),

                    _buildLanguageOption(
                      'Türkçe',
                      selectedLanguage,
                      Navigator.of(context).pop,
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
    VoidCallback onPressed,
  ) {
    return ListTile(
      title: Text(language),
      trailing: language == selectedLanguage
          ? const Icon(
              Icons.check,
              color: Colors.white,
            )
          : null,
      onTap: () {
        HapticFeedback.mediumImpact();

        onPressed();
      },
    );
  }
}