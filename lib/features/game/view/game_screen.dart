import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/blocs/queue/queue.dart';
import 'package:fusion/features/home/view/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../blocs/blocs.dart';
import '../widgets/widgets.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  static const String path = '/game';
  static const String name = 'game';
  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    final gameState = context.watch<GameBloc>().state;
    final devicePrefsState = context.watch<DevicePrefsBloc>().state;

    final currentPlayerNumber =
        gameState.gameModel!.player1.uid == userState.userModel!.uid ? 1 : 2;

    if (gameState.gameModel!.gameStatus != 0 && context.mounted) {
      showPopUp(
        context,
        isHapticsOn: devicePrefsState.devicePrefs.isHapticsOn,
        popUpWidget: GameRewardsPopUp(
          isWinner: currentPlayerNumber == gameState.gameModel?.gameStatus,
        ),
      );
    }
    return BaseScaffold(
      body: BaseColumn(
        children: [
          const Text('OYUNDAYIZ'),
          TextButton(
            onPressed: () async {
              try {
                // context.read<GameBloc>().add(const ClearGameRequested());
                // context.read<QueueBloc>().add(const CheckQueueRequested());

                // await FirebaseFirestore.instance
                // .collection('users')
                // .doc(
                // FirebaseAuth.instance.currentUser!.uid,
                // )
                // .update({
                // 'gameId': null,
                // });
                // if (context.mounted) context.goNamed(HomeScreen.name);

                // context.read<GameBloc>().add(const WinTheGameRequested());
                showPopUp(
                  context,
                  isHapticsOn: devicePrefsState.devicePrefs.isHapticsOn,
                  popUpWidget: GameRewardsPopUp(
                    isWinner:
                        currentPlayerNumber == gameState.gameModel!.gameStatus,
                  ),
                );
              } catch (exception) {
                return;
              }
            },
            child: const Text('Oyunu Kazan'),
          ),
        ],
      ),
    );
  }

  void showPopUp(
    BuildContext context, {
    required bool isHapticsOn,
    required Widget popUpWidget,
  }) =>
      showDialog<void>(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          if (isHapticsOn) {
            HapticFeedback.mediumImpact();
          }
          return popUpWidget;
        },
      );
}
