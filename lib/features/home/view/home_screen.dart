import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/blocs/blocs.dart';
import 'package:shared_widgets/shared_widgets.dart';

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
