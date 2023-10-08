import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    context.read<UserBloc>().add(const WatchWithUidRequested());
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
    userBloc.add(const StopWatchingUserRequested());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = context.read<UserBloc>();

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        if (userState.user?.gameId != null && mounted) {
          context.goNamed(GameScreen.name);
        }
        return BlocBuilder<QueueBloc, QueueState>(
          builder: (context, queueState) {
            if (queueState is QueueEmpty && queueState.errorMessage == null) {
              context.goNamed(HomeScreen.name);
            }
            if (queueState is QueueReadyToEnter) {
              if (userState.user!.gameId != null && mounted) {
                context.goNamed(GameScreen.name);
              } else {
                context.read<QueueBloc>().add(const EnterQueueRequested());
              }
            }
            if ((queueState is QueueLeaved) && mounted) {
              context.goNamed(HomeScreen.name);
            }
            return QueueView(
              queueState: queueState,
            );
          },
        );
      },
    );
  }
}
