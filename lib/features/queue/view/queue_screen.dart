import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/home/view/view.dart';
import 'package:fusion/repositories/queue_repository/bloc/queue_bloc.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key});
  static const String path = '/queue';
  static const String name = 'queue';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return BlocBuilder<QueueBloc, QueueState>(
          builder: (context, queueState) {
            if (queueState is QueueReadyToEnter) {
              if (userState.user!.gameId != null) {
                // Go to game screen
              } else {
                context.read<QueueBloc>().add(const EnterQueueRequested());
              }
            }
            if (queueState is QueueLeaved) {
              context.goNamed(HomeScreen.name);
            }

            return BaseScaffold(
              safeArea: true,
              body: BaseColumn(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Match Making'),
                  if (queueState is QueueHasData)
                    const Text('In Queue')
                  else if (queueState is QueueEmpty)
                    const Text('Get Ready'),
                  GradientButton(
                    text: 'Cancel',
                    onPressed: () {
                      if (queueState is QueueReadyToEnter) {
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
