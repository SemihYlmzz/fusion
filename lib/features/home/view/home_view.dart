import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../app/cubits/audio/audio.dart';
import '../../../app/gen/assets.gen.dart';

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
            DeckPreview(),
            RefreshDeckButton(),
            PlayButton(),
          ],
        ),
      ],
    );
  }
}
