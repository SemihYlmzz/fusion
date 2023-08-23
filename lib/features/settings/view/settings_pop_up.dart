import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/audio/audio.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../config/style/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });
  static const String path = '/settings';
  static const String name = 'settings';

  static const double settingsBoxWidth = 320;
  static const double settingsCardWidth = 300;
  static const double settingsBoxHeight = 600;
  static const double settingsCardHeight = 570;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, devicePrefsState) {

        context.read<AudioCubit>().setBackgroundMusicVolume(
              devicePrefsState.devicePrefs.backGroundSoundVolume,
              devicePrefsState.devicePrefs.generalSoundVolume,
            );
        context.read<AudioCubit>().setSoundEffectsVolume(
              devicePrefsState.devicePrefs.soundEffectsSoundVolume,
              devicePrefsState.devicePrefs.generalSoundVolume,
            );

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
                                    GeneralSoundVolumeChanger(
                                      devicePrefs: devicePrefsState.devicePrefs,
                                    ),
                                    BackgroundMusicVolumeChanger(
                                      devicePrefs: devicePrefsState.devicePrefs,
                                    ),
                                    SoundEffectsVolumeChanger(
                                      devicePrefs: devicePrefsState.devicePrefs,
                                    ),
                                    DialoguesVolumeChanger(
                                      devicePrefs: devicePrefsState.devicePrefs,
                                    ),
                                  ],
                                ),
                                HapticsPreferencesChanger(
                                  devicePrefs: devicePrefsState.devicePrefs,
                                ),
                                ChangeLanguageButton(
                                  devicePrefs: devicePrefsState.devicePrefs,
                                ),
                                UsernameChanger(
                                  devicePrefs: devicePrefsState.devicePrefs,
                                ),
                                SettingsBorderedButton(
                                  buttonText:
                                      AppLocalizations.of(context).account,
                                  buttonWidget: const Text('Google'),
                                ),
                                const SignOutButton(),
                                const ReportBugButton(),
                                const SendMailButton(),
                                const ShowPrivacyButton(),
                                const ShowTermsButton(),
                                const ShowCreditsButton(),
                                const DeleteAccountButton(),
                                Padding(
                                  padding: SharedPaddings.vertical20,
                                  child: const Text('v1.0.0'),
                                ),
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
      },
    );
  }
}
