import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/cubits/ad/ad.dart';
import '../../../app/cubits/audio/audio.dart';
import '../../../app/gen/assets.gen.dart';
import '../../../app/gen/l10n/l10n.dart';
import '../../../blocs/blocs.dart';
import '../../settings/settings.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AudioCubit>().playBackgroundSound(
          Assets.music.background.mainMenuLoop,
        );
    return BaseColumn(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          leadingWidth: 115,
          title: const UsernameText(),
          centerTitle: true,
          actions: const [
            SettingsButton(),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        const Column(
          children: [
            SizedBox(
              width: 320, //  Kaldırılmalı
              height: 250, //  Kaldırılmalı
              child: DeckPreview(),
            ),
            RefreshDeckButton(),
            PlayButton(),
          ],
        ),
      ],
    );
  }
}

class RefreshDeckButton extends StatelessWidget {
  const RefreshDeckButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.refresh),
        BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
          builder: (context, devicePrefsState) {
            return TextButton(
              onPressed: () async {
                await context.read<AdCubit>().loadAndShowRewardedAd(() async {
                  await context.read<AudioCubit>().playSoundEffect(
                        Assets.music.sfx.refreshDeckButtonSfx,
                      );
                  if (devicePrefsState.devicePrefs.isHapticsOn) {
                    await HapticFeedback.heavyImpact();
                  }
                  if (context.mounted) {
                    context.read<UserBloc>().add(const RefreshDeckRequested());
                  }
                });
              },
              child: Text(
                L10n.current.refreshDeck,
                style: const TextStyle(
                  color: Colors.greenAccent,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class UsernameText extends StatelessWidget {
  const UsernameText({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return userState is UserHasData
            ? Text(userState.userModel!.username)
            : const SizedBox();
      },
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, devicePrefsState) {
        return IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            context.read<AudioCubit>().playSoundEffect(
                  Assets.music.sfx.settingsButtonSfx,
                );
            if (devicePrefsState.devicePrefs.isHapticsOn) {
              HapticFeedback.heavyImpact();
            }
            openSettingsPopUp(context);
          },
          iconSize: 44,
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
