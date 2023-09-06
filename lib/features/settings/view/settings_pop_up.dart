import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../config/style/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';
import '../../../shared/widgets/bottom_sheets/credits_bottom_sheet.dart';
import '../../../shared/widgets/bottom_sheets/privacy_bottom_sheet.dart';
import '../../../shared/widgets/bottom_sheets/terms_of_service_bottom_sheet.dart';
import '../../../shared/widgets/pop_ups/cant_rename_pop_up.dart';
import '../../../shared/widgets/pop_ups/change_username_pop_up.dart';
import '../widgets/pop_ups/delete_account_pop_up.dart';
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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        final user = userState.user;
        return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
          builder: (context, devicePrefsState) {
            final devicePrefs = devicePrefsState.devicePrefs;
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
                                  children: [
                                    const SizedBox(height: 8),

                                    // VOLUME SLIDERS
                                    GeneralSoundSlider(
                                      devicePrefs: devicePrefs,
                                    ),
                                    BackgroundMusicSlider(
                                      devicePrefs: devicePrefs,
                                    ),
                                    SoundEffectsSlider(
                                      devicePrefs: devicePrefs,
                                    ),
                                    DialoguesSlider(devicePrefs: devicePrefs),

                                    // INFORMATIONAL BUTTONS
                                    SettingsBorderedButton(
                                      buttonText:
                                          AppLocalizations.of(context).haptics,
                                      buttonWidget: Switch.adaptive(
                                        value: devicePrefs.isHapticsOn,
                                        onChanged: (newValue) {
                                          context.read<DevicePrefsBloc>().add(
                                                UpdateDevicePrefs(
                                                  devicePrefs.copyWith(
                                                    isHapticsOn: newValue,
                                                  ),
                                                ),
                                              );
                                        },
                                      ),
                                    ),
                                    SettingsBorderedButton(
                                      buttonText:
                                          AppLocalizations.of(context).language,
                                      onTap: () => showPopUp(
                                        SelectableLanguagesPopUp(
                                          devicePrefs: devicePrefs,
                                        ),
                                        devicePrefs,
                                        context,
                                      ),
                                      buttonWidget: Text(
                                        AppLocalizations.of(context)
                                            .currentLanguage,
                                      ),
                                    ),
                                    SettingsBorderedButton(
                                      buttonText:
                                          AppLocalizations.of(context).username,
                                      buttonWidget: const Text('CL4Y'),
                                      onTap: () {
                                        final month = user!
                                            .accountnameChangeEligibilityDate
                                            .difference(DateTime.now());
                                        if (month.isNegative) {
                                          showPopUp(
                                            const EnterNamePopUp(),
                                            devicePrefs,
                                            context,
                                          );
                                        } else {
                                          showPopUp(
                                            const CantRenamePopUp(),
                                            devicePrefs,
                                            context,
                                          );
                                        }
                                      },
                                    ),
                                    SettingsBorderedButton(
                                      buttonText:
                                          AppLocalizations.of(context).account,
                                      buttonWidget: const Text('Google'),
                                    ),

                                    // SIGN OUT BUTTONS
                                    const SignOutButton(),

                                    // BASIC BUTTONS
                                    SettingsThickButton(
                                      buttonText: AppLocalizations.of(context)
                                          .reportABug,
                                    ),
                                    SettingsThickButton(
                                      buttonText: AppLocalizations.of(context)
                                          .sendUsAMail,
                                    ),
                                    SettingsThickButton(
                                      buttonText:
                                          AppLocalizations.of(context).privacy,
                                      onTap: () {
                                        displayBottomSheet(
                                          const PrivacyBottomSheet(),
                                          devicePrefs,
                                          context,
                                        );
                                      },
                                    ),
                                    SettingsThickButton(
                                      buttonText: AppLocalizations.of(context)
                                          .termsOfService,
                                      onTap: () {
                                        displayBottomSheet(
                                          const TermsOfService(),
                                          devicePrefs,
                                          context,
                                        );
                                      },
                                    ),
                                    SettingsThickButton(
                                      buttonText:
                                          AppLocalizations.of(context).credits,
                                      onTap: () {
                                        displayBottomSheet(
                                          const CreditsBottomSheet(),
                                          devicePrefs,
                                          context,
                                        );
                                      },
                                    ),
                                    SettingsThickButton(
                                      buttonText: AppLocalizations.of(context)
                                          .deleteAccount,
                                      onTap: () {
                                        showPopUp(
                                          DeleteAccountPopUp(
                                            devicePrefs: devicePrefs,
                                          ),
                                          devicePrefs,
                                          context,
                                        );
                                      },
                                    ),

                                    // GAME VERSION
                                    const Padding(
                                      padding: SharedPaddings.vertical20,
                                      child: Text('v1.0.0'),
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
      },
    );
  }

  Future<void> showPopUp(
    Widget popUpWidget,
    DevicePrefs devicePrefs,
    BuildContext context,
  ) =>
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          if (devicePrefs.isHapticsOn) {
            HapticFeedback.mediumImpact();
          }
          return popUpWidget;
        },
      );
  Future<void> displayBottomSheet(
    Widget bottomSheetWidget,
    DevicePrefs devicePrefs,
    BuildContext context,
  ) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          if (devicePrefs.isHapticsOn) {
            HapticFeedback.mediumImpact();
          }
          return bottomSheetWidget;
        },
      );
}
