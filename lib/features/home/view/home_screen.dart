
import 'package:flutter/material.dart';
import 'package:fusion/features/home/view/home_view.dart';
import 'package:shared_widgets/shared_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      body: HomeView(),
    );
  }
}
