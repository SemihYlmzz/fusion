import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/home/home.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../repositories/user_repository/bloc/user_bloc.dart';
import '../widgets/user_loading_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String path = '/home';
  static const String name = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            if (userState is UserHasData) {
              return LoadingScreen(
                isLoading: authState is AuthLoading,
                size: MediaQuery.of(context).size,
                child: BaseScaffold(
                  safeArea: true,
                  body: HomeView(
                    uid: authState.authEntity.id,
                  ),
                ),
              );
            }
            if (userState is UserLoading) {
              return UserLoadingView(uid: authState.authEntity.id);
            }
            if (userState is UserEmpty) {
              return HomeNoUserDataView(
                uid: authState.authEntity.id,
              );
            }

            return const UserOutStateView();
          },
        );
      },
    );
  }
}
