import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/gen/assets.gen.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../audio/audio_cubit.dart';
import '../../../l10n/app_localizations.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, state) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return GradientButton(
              text: AppLocalizations.of(context).play,
              onPressed: () {
                context.read<AudioCubit>().playSoundEffect(
                      Assets.music.sfx.playButtonSfx,
                    );
                if (devicePrefs.isHapticsOn) {
                  HapticFeedback.heavyImpact();
                }
              },
            );
          },
        );
      },
    );
  }
}
