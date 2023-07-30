import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
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
              child: SizedBox(
                width: 320,
                height: 600,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 300,
                          height: 570,
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
                                      const Divider(color: Colors.white),
                                      Padding(
                                        padding: SharedPaddings.horizontal32,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'HAPTICS',
                                              style: GoogleFonts.bangers(
                                                fontSize: 28,
                                              ),
                                            ),
                                            StatefulBuilder(
                                              builder: (context, setstate) {
                                                return Switch.adaptive(
                                                  value: isHapticsOn,
                                                  onChanged: (newValue) {
                                                    setstate(() {});
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(color: Colors.white),
                                      Padding(
                                        padding: SharedPaddings.horizontal32,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Language',
                                              style: GoogleFonts.bangers(
                                                fontSize: 24,
                                              ),
                                            ),
                                            const Text('Device'),
                                          ],
                                        ),
                                      ),
                                      const Divider(color: Colors.white),
                                      Padding(
                                        padding: SharedPaddings.horizontal32,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'USERNAME',
                                              style: GoogleFonts.bangers(
                                                fontSize: 24,
                                              ),
                                            ),
                                            const Text('CL4Y'),
                                          ],
                                        ),
                                      ),
                                      const Divider(color: Colors.white),
                                      Padding(
                                        padding: SharedPaddings.horizontal32,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'ACCOUNT',
                                              style: GoogleFonts.bangers(
                                                fontSize: 24,
                                              ),
                                            ),
                                            const Text('Google'),
                                          ],
                                        ),
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
                                      const Divider(color: Colors.white),
                                      settingsButton('REPORT A BUG'),
                                      settingsButton('SEND US A MAIL'),
                                      settingsButton('PRIVACY'),
                                      settingsButton('TERMS OF SERVICE'),
                                      settingsButton('CREDITS'),
                                      settingsButton('DELETE ACCOUNT'),
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
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: SettingsCloseButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding settingsButton(String buttonText) {
    return Padding(
      padding: SharedPaddings.vertical4,
      child: Padding(
        padding: SharedPaddings.horizontal32,
        child: Container(
          color: Colors.white12,
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
