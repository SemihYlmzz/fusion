import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../config/style/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';
import '../widgets/settings_text.dart';
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
                                  volumeText: 'General Volume',
                                ),
                                SettingsVolumeSlider(
                                  volumeLevel: musicVolumeLevel,
                                  volumeText: 'Music Volume',
                                ),
                                SettingsVolumeSlider(
                                  volumeText: 'Sound Effects Volume',
                                  volumeLevel: soundEffectVolumeLevel,
                                ),
                                SettingsVolumeSlider(
                                  volumeText: 'Dialogue Volume',
                                  volumeLevel: dialogueVolumeLevel,
                                ),
                              ],
                            ),
                            SettingsBorderedButton(
                              buttonText: 'HAPTICS',
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
                            const SettingsBorderedButton(
                              buttonText: 'LANGUAGE',
                              buttonWidget: Text('Device'),
                            ),
                            const SettingsBorderedButton(
                              buttonText: 'USERNAME',
                              buttonWidget: Text('CL4Y'),
                            ),
                            const SettingsBorderedButton(
                              buttonText: 'ACCOUNT',
                              buttonWidget: Text('Google'),
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
                            const SettingsThickButton(
                              buttonText: 'REPORT A BUG',
                            ),
                            const SettingsThickButton(
                              buttonText: 'SEND US A MAIL',
                            ),
                            const SettingsThickButton(buttonText: 'PRIVACY'),
                            const SettingsThickButton(
                              buttonText: 'TERMS OF SERVICE',
                            ),
                            const SettingsThickButton(buttonText: 'CREDITS'),
                            const SettingsThickButton(
                              buttonText: 'DELETE ACCOUNT',
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
}

class SettingsThickButton extends StatelessWidget {
  const SettingsThickButton({
    required this.buttonText,
    super.key,
  });
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical4,
      child: Padding(
        padding: SharedPaddings.horizontal32,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            border: GradientBoxBorder(
              gradient: LinearGradient(
                colors: [
                  Colors.orange.withOpacity(0.65),
                  Colors.pink.withOpacity(0.65),
                ],
              ),
            ),
          ),
          height: 40,
          width: 320,
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.bangers(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClosableAnimatedScaffold extends StatelessWidget {
  const ClosableAnimatedScaffold({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {},
          child: Center(
            child: Animate(
              effects: const [
                FadeEffect(),
                ScaleEffect(
                  begin: Offset(0.85, 0.85),
                  end: Offset(1, 1),
                ),
                ShimmerEffect()
              ],
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsBorderedButton extends StatelessWidget {
  const SettingsBorderedButton({
    required this.buttonText,
    required this.buttonWidget,
    super.key,
  });
  final String buttonText;
  final Widget buttonWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: Column(
        children: [
          Image.asset(
            Assets.images.borders.settingsBorderTop.path,
          ),
          Padding(
            padding: SharedPaddings.horizontal16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  buttonText,
                  style: GoogleFonts.bangers(
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 44,
                  child: Center(child: buttonWidget),
                ),
              ],
            ),
          ),
          Image.asset(
            Assets.images.borders.settingsBorderBottom.path,
          ),
        ],
      ),
    );
  }
}

class SettingsVolumeSlider extends StatelessWidget {
  const SettingsVolumeSlider({
    required this.volumeText,
    required this.volumeLevel,
    super.key,
  });

  final String volumeText;
  final double volumeLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SharedPaddings.left32,
          child: Text(volumeText),
        ),
        StatefulBuilder(
          builder: (context, setstate) {
            return Slider(
              value: volumeLevel,
              onChanged: (newValue) {
                setstate(() {});
              },
            );
          },
        ),
      ],
    );
  }
}
