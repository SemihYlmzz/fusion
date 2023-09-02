import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/game/view/game_screen.dart';
import 'package:fusion/features/home/view/view.dart';
import 'package:fusion/repositories/queue_repository/bloc/queue_bloc.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

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
            if (queueState is QueueReadyToEnter) {
              if (userState.user!.gameId != null && mounted) {
                context.goNamed(GameScreen.name);
              } else {
                context.read<QueueBloc>().add(const EnterQueueRequested());
              }
            }
            if (queueState is QueueLeaved && mounted) {
              context.goNamed(HomeScreen.name);
            }

            return BaseScaffold(
              safeArea: true,
              body: BaseColumn(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(userState.user?.username ?? ''),
                  if (queueState is QueueHasData)
                    const Text('In Queue')
                  else if (queueState is QueueEmpty)
                    const Text('Get Ready'),
                  GradientButton(
                    text: 'Cancel',
                    onPressed: () {
                      if (queueState is QueueReadyToEnter && mounted) {
                        return context.goNamed(HomeScreen.name);
                      }
                      if (queueState is QueueHasData) {
                        return context
                            .read<QueueBloc>()
                            .add(const LeaveQueueRequested());
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
