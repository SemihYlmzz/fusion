import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

class HomeNoUserDataView extends StatelessWidget {
  const HomeNoUserDataView({required this.uid,super.key});
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseColumn(
        children: [
          const Column(
            children: [
              Text('Congrats You logged in!'),
              Text('But something went wrong while gettin your data'),
            ],
          ),
          TextButton(
            onPressed: () {
              context.read<UserBloc>().add(UserReadWithUidRequested(uid));
            },
            child: const Text('Please try again.'),
          ),
        ],
      ),
    );
  }
}