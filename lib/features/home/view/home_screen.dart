import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/blocs/blocs.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../core/enums/error_clean_type.dart';
import '../../../core/enums/error_display_type.dart';
import '../../queue/view/queue_screen.dart';
import '../home.dart';
import 'home_empty_user_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String path = '/home';
  static const String name = 'home';

  @override
  Widget build(BuildContext context) {
    // To make status bar white
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );
    final userState = context.watch<UserBloc>().state;
    final queueState = context.watch<QueueBloc>().state;


    if (userState is! UserHasData && userState is! UserLoading) {
      context.read<UserBloc>().add(
            const WatchWithUidRequested(
              errorDisplayType: ErrorDisplayType.none,
            ),
          );
    }
    // Checking if user in queue or not
    // then navigating if user in queue
    if (userState is UserHasData) {
      if (queueState is QueueEmpty || queueState is QueueLeaved) {
        context.read<QueueBloc>().add(
              const CheckQueueRequested(
                errorCleanType: ErrorCleanType.onUserEvent,
              ),
            );
      }

      if (queueState is QueueHasData) {
        context.goNamed(QueueScreen.name);
      }
    }

    if (userState.userModel != null) {
      return const BaseScaffold(
        safeArea: true,
        body: HomeView(),
      );
    } else {
      return const HomeEmptyUserView();
    }
  }
}
