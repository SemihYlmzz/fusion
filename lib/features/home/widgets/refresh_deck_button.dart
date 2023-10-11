import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/cubits/ad/ad.dart';
import '../../../app/cubits/audio/audio.dart';
import '../../../app/gen/assets.gen.dart';
import '../../../app/gen/l10n/l10n.dart';
import '../../../blocs/blocs.dart';

class RefreshDeckButton extends StatelessWidget {
  const RefreshDeckButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isHapticsOn =
        context.watch<DevicePrefsBloc>().state.devicePrefs.isHapticsOn;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.refresh),
        TextButton(
          onPressed: () async {
            await context.read<AdCubit>().loadAndShowRewardedAd(() async {
              await context.read<AudioCubit>().playSoundEffect(
                    Assets.music.sfx.refreshDeckButtonSfx,
                  );
              if (isHapticsOn) {
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
        ),
      ],
    );
  }
}
