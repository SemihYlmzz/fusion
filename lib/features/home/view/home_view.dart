import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/cubits/audio/audio.dart';
import '../../../app/gen/assets.gen.dart';

import '../../../blocs/blocs.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final gameId = context.select(
      (UserBloc userBloc) => userBloc.state.userModel?.gameId,
    );
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
        Column(
          children: [
            const DeckPreview(),
            const RefreshDeckButton(),
            BlocBuilder<QueueBloc, QueueState>(
              builder: (context, queueState) {
                return queueState is QueueHasError
                    ? const QueueControlButton()
                    : gameId == null
                        ? const PlayButton()
                        : const ReconnectGameButton();
              },
            ),
          ],
        ),
      ],
    );
  }
}
