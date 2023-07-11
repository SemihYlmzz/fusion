import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/config/style/colors.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return GradientButton(
          text: AppLocalizations.of(context).play,
          onPressed: () {
            if (userState.user?.username == '') {
              openSettingsPopUp(context);
            } else {}
          },
        );
      },
    );
  }

  Future<void> openSettingsPopUp(BuildContext context) async {
    // ignore: omit_local_variable_types
    double value = 0;
    var haptics = true;
    return showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Material(
              color: Colors.transparent,
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
                  child: Container(
                    width: 320,
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
                        SizedBox(
                          height: 70,
                          child: Center(
                            child: Text(
                              'SETTINGS',
                              style: GoogleFonts.bangers(fontSize: 50),
                            ),
                          ),
                        ),
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: SharedPaddings.left32,
                                          child: Text('General Volume'),
                                        ),
                                        StatefulBuilder(
                                          builder: (context, setstate) {
                                            return Slider(
                                              value: value,
                                              onChanged: (newValue) {
                                                value = newValue;
                                                setstate(() {});
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: SharedPaddings.left32,
                                          child: Text('Music Volume'),
                                        ),
                                        StatefulBuilder(
                                          builder: (context, setstate) {
                                            return Slider(
                                              value: value,
                                              onChanged: (newValue) {
                                                value = newValue;
                                                setstate(() {});
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: SharedPaddings.left32,
                                          child: Text('Sound Effects Volume'),
                                        ),
                                        StatefulBuilder(
                                          builder: (context, setstate) {
                                            return Slider(
                                              value: value,
                                              onChanged: (newValue) {
                                                value = newValue;
                                                setstate(() {});
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: SharedPaddings.left32,
                                          child: Text('Dialogue Volume'),
                                        ),
                                        StatefulBuilder(
                                          builder: (context, setstate) {
                                            return Slider(
                                              value: value,
                                              onChanged: (newValue) {
                                                value = newValue;
                                                setstate(() {});
                                              },
                                            );
                                          },
                                        ),
                                      ],
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
                                            value: haptics,
                                            onChanged: (newValue) {
                                              haptics = newValue;
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
            ),
          ),
        );
      },
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
