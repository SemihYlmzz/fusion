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
    context.read<AudioCubit>().playBackgroundSound(
          Assets.music.background.mainMenuLoop,
          devicePrefs.soundEffectsSoundVolume,
          devicePrefs.generalSoundVolume,
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
                        await HapticFeedback.heavyImpact();
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
                )
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> openSettingsPopUp(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        HapticFeedback.heavyImpact();

        return const SettingsScreen(
          generalVolumeLevel: 0.5,
          musicVolumeLevel: 0.7,
          soundEffectVolumeLevel: 0.35,
          dialogueVolumeLevel: 0.2,
          isHapticsOn: true,
        );
      },
    );
  }
}
