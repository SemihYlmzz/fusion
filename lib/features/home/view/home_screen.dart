import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/audio/audio.dart';
import 'package:fusion/features/home/home.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';
import '../widgets/user_loading_view.dart';

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
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, devicePrefsState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                if (userState is UserHasData || userState is UserLoading) {
                  return BlocBuilder<AudioCubit, AudioState>(
                    builder: (context, audioState) {
                      return LoadingScreen(
                        isLoading: authState is AuthLoading ||
                            userState is UserLoading,
                        size: MediaQuery.of(context).size,
                        child: BaseScaffold(
                        
                          safeArea: true,
                          body: HomeView(
                            uid: authState.authEntity.id,
                            devicePrefs: devicePrefsState.devicePrefs,
                          ),
                        ),
                      );
                    },
                  );
                }
                if (userState is UserInitializing) {
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
      },
    );
  }
}
