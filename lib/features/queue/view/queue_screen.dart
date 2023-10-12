import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
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
    final queueState = context.watch<QueueBloc>().state;
    final userState = context.watch<UserBloc>().state;

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
    if (userState.userModel?.gameId != null) {
      context.goNamed(GameScreen.name);
    }
    return QueueView(
      queueState: queueState,
    );
  }
}
