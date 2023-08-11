import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/gen/assets.gen.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../audio/audio_cubit.dart';
import '../../../l10n/app_localizations.dart';

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
            context.read<AudioCubit>().playSoundEffect(
                  Assets.music.sfx.playButtonSfx,
                );
            HapticFeedback.heavyImpact();
          },
        );
      },
    );
  }
}
