import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    required this.uid,
    super.key,
  });
  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmpty) {
          return BaseColumn(
            children: [
              const Text('Something went wrong.'),
              Column(
                children: [
                  TextButton(
                    child: const Text('RETRY'),
                    onPressed: () {
                      context.read<UserBloc>().add(
                            UserReadWithUidRequested(uid),
                          );
                    },
                  ),
                  TextButton(
                    child: const Text('LOGOUT'),
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthLogoutRequested());
                    },
                  ),
                ],
              )
            ],
          );
        }
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserHasData) {
          return BaseColumn(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBar(
                leadingWidth: 115,
                title: Text(state.user!.username),
                actions: const [
                  SettingsButton(),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 320,
                    height: 250,
                    child: DeckPreview(
                      deck: state.user!.deck,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'GET NEW CARDS',
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                  ),
                  const PlayButton()
                ],
              ),
            ],
          );
        }
        return const BaseColumn();
      },
    );
  }
}

class DeckPreview extends StatelessWidget {
  const DeckPreview({required this.deck, super.key});
  final List<String> deck;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GameCardPreview(),
            GameCardPreview(),
            GameCardPreview(),
            GameCardPreview(),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GameCardPreview(),
            GameCardPreview(),
            GameCardPreview(),
            GameCardPreview(),
          ],
        ),
      ],
    );
  }
}

class GameCardPreview extends StatelessWidget {
  const GameCardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 115,
      color: Colors.white.withOpacity(0.1),
      child: Stack(
        children: [
          Container(
            width: 65,
            height: 100,
            color: Colors.green.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
