import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/cubits/ad/ad.dart';
import '../../../app/cubits/audio/audio.dart';
import '../../../app/gen/assets.gen.dart';
import '../../../app/l10n/l10n.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';
import '../../../repositories/user_repository/domain/entities/user.dart';
import '../../settings/settings.dart';
import '../widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    required this.uid,
    required this.devicePrefs,
    required this.user,
    required this.adState,
    super.key,
  });
  final String uid;
  final DevicePrefs devicePrefs;
  final User user;
  final AdState adState;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    context.read<AudioCubit>().connectDevicePrefs(
          widget.devicePrefs.backGroundSoundVolume,
          widget.devicePrefs.dialogsSoundVolume,
          widget.devicePrefs.generalSoundVolume,
          widget.devicePrefs.soundEffectsSoundVolume,
        );
    context.read<AudioCubit>().playBackgroundSound(
          Assets.music.background.mainMenuLoop,
        );
    return BaseColumn(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          leadingWidth: 115,
          title: Text(widget.user.username),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.read<AudioCubit>().playSoundEffect(
                      Assets.music.sfx.settingsButtonSfx,
                    );
                if (widget.devicePrefs.isHapticsOn) {
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
                deck: widget.user.deck,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.refresh),
                TextButton(
                  onPressed: () async {
                    await context
                        .read<AdCubit>()
                        .loadAndShowRewardedAd(() async {
                      await context.read<AudioCubit>().playSoundEffect(
                            Assets.music.sfx.refreshDeckButtonSfx,
                          );
                      if (widget.devicePrefs.isHapticsOn) {
                        await HapticFeedback.heavyImpact();
                      }
                      if (context.mounted) {
                        context
                            .read<UserBloc>()
                            .add(const RefreshDeckRequested());
                      }
                    });
                  },
                  child: Text(
                    context.l10n.refreshDeck,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ],
            ),
            PlayButton(
              devicePrefs: widget.devicePrefs,
            ),
          ],
        ),
      ],
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
