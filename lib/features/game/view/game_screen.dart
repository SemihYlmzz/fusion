import 'package:flutter/material.dart';
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
          TextButton(onPressed: () {}, child: const Text('Birşey yap')),
        ],
      ),
    );
  }
}
