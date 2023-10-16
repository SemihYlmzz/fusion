import 'package:flutter/material.dart';
import 'package:shared_widgets/shared_widgets.dart';

class GameRewardsPopUp extends StatelessWidget {
  const GameRewardsPopUp({required this.isWinner, super.key});
  final bool isWinner;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: Colors.black87,
      onScaffoldTap: () {
        Navigator.popUntil(
          context,
          (route) => route.isFirst,
        );
      },
      body: BaseColumn(
        children: [
          TextButton(
            child: const Text('CONTINUE'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
