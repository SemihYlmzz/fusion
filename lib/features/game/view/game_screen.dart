import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/blocs/game/game_bloc.dart';
import 'package:fusion/blocs/queue/queue.dart';
import 'package:fusion/features/home/view/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  static const String path = '/game';
  static const String name = 'game';
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BaseColumn(
        children: [
          const Text('OYUNDAYIZ'),
          TextButton(
            onPressed: () async {
              try {
                context.read<GameBloc>().add(const ClearGameRequested());
                context.read<QueueBloc>().add(const CheckQueueRequested());

                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(
                      FirebaseAuth.instance.currentUser!.uid,
                    )
                    .update({
                  'gameId': null,
                });
                if (context.mounted) context.goNamed(HomeScreen.name);
              } catch (exception) {
                return;
              }
            },
            child: const Text('Birşey yap'),
          ),
        ],
      ),
    );
  }
}
