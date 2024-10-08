import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/gen/assets.gen.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:go_router/go_router.dart';

import '../../../app/cubits/cubits.dart';
import '../../../blocs/blocs.dart';
import '../../game/view/game_screen.dart';
import '../../home/view/view.dart';
import 'queue_view.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});
  static const String path = '/queue';
  static const String name = 'queue';

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> with WidgetsBindingObserver {
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      context.read<QueueBloc>().add(const LeaveQueueRequested());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AudioCubit>().playBackgroundSound(
          Assets.music.background.queueLoop,
        );
    final queueState = context.watch<QueueBloc>().state;
    final userState = context.watch<UserBloc>().state;
    final gameState = context.watch<GameBloc>().state;

    if ((queueState is QueueHasError && queueState.queue == null) ||
        userState is UserHasError ||
        queueState is QueueLeaved) {
      context.goNamed(HomeScreen.name);
    }
    if (queueState is QueueReadyToEnter) {
      context.read<QueueBloc>().add(
            const EnterQueueRequested(
              errorCleanType: ErrorCleanType.onUserEvent,
            ),
          );
    }
    // GAME THINGS
    if (userState.userModel?.gameId != null) {
      context.read<GameBloc>().add(
            WatchGameWithGameIdRequested(gameId: userState.userModel!.gameId!),
          );
    }
    if (gameState is GameHasData) {
      final isGameNotEnded = gameState.gameModel!.gameStatus == 0;
      final isGameAccepted = gameState.gameModel!.acceptedUserIds
          .contains(userState.userModel!.uid);

      if (!isGameAccepted && isGameNotEnded) {
        context.read<GameBloc>().add(const AcceptGameRequested());
      }
      if (gameState.gameModel!.acceptedUserIds.length > 1 || !isGameNotEnded) {
        context.goNamed(GameScreen.name);
      }
    }
    return QueueView(
      queueState: queueState,
      gameState: gameState,
      userState: userState,
    );
  }
}
