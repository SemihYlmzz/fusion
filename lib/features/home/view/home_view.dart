import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/gen/assets.gen.dart';
import 'package:fusion/l10n/app_localizations.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../audio/audio_cubit.dart';
import '../../settings/settings.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    required this.uid,
    required this.devicePrefs,
    super.key,
  });
  final String uid;
  final DevicePrefs devicePrefs;

  @override
  Widget build(BuildContext context) {
    context.read<AudioCubit>().connectDevicePrefs(
          devicePrefs.backGroundSoundVolume,
          devicePrefs.dialogsSoundVolume,
          devicePrefs.generalSoundVolume,
          devicePrefs.soundEffectsSoundVolume,
        );
    context.read<AudioCubit>().playBackgroundSound(
          Assets.music.background.mainMenuLoop,
        );
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return BaseColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBar(
              leadingWidth: 115,
              title: Text(userState.user!.username),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    context.read<AudioCubit>().playSoundEffect(
                          Assets.music.sfx.settingsButtonSfx,
                        );
                    if (devicePrefs.isHapticsOn) {
                      HapticFeedback.heavyImpact();
                    }
                    openSettingsPopUp(context);
                  },
                  iconSize: 44,
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Column(
              children: [
                SizedBox(
                  width: 320,
                  height: 250,
                  child: DeckPreview(
                    deck: userState.user!.deck,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.refresh),
                    TextButton(
                      onPressed: () async {
                        await context.read<AudioCubit>().playSoundEffect(
                              Assets.music.sfx.refreshDeckButtonSfx,
                            );
                        if (devicePrefs.isHapticsOn) {
                          await HapticFeedback.heavyImpact();
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context).refreshDeck,
                        style: const TextStyle(color: Colors.greenAccent),
                      ),
                    ),
                  ],
                ),
                PlayButton(
                  devicePrefs: devicePrefs,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> openSettingsPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const SettingsScreen();
      },
    );
  }
}
