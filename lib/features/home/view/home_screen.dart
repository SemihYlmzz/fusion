import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/network/network_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../ad/ad.dart';
import '../../../audio/audio.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';
import '../../../repositories/delete_request_repository/bloc/delete_request_bloc.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/queue_repository/bloc/queue_bloc.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';
import '../../queue/view/queue_screen.dart';
import '../home.dart';
import 'user_loading_view.dart';

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
        return BlocBuilder<NetworkCubit, NetworkState>(
          builder: (context, networkState) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                return BlocBuilder<DeleteRequestBloc, DeleteRequestState>(
                  builder: (context, deleteRequestState) {
                    if (authState is AuthAuthenticated &&
                        deleteRequestState is DeleteRequestNotChecked &&
                        networkState.hasConnection) {
                      context.read<DeleteRequestBloc>().add(
                            CheckDeleteRequestRequested(
                              authState.authEntity.id,
                            ),
                          );
                    }
                    if (deleteRequestState is DeleteRequestHasData) {
                      context
                          .read<DeleteRequestBloc>()
                          .add(const CancelDeleteRequestRequested());
                    }
                    return BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                        if (userState is UserHasData ||
                            userState is UserLoading) {
                          return BlocBuilder<QueueBloc, QueueState>(
                            builder: (context, queueState) {
                              if ((queueState is QueueEmpty ||
                                      queueState is QueueLeaved) &&
                                  queueState.errorMessage == null &&
                                  networkState.hasConnection) {
                                context
                                    .read<QueueBloc>()
                                    .add(const CheckQueueRequested());
                              }

                              if (queueState is QueueHasData) {
                                context.goNamed(QueueScreen.name);
                              }

                              return BlocBuilder<AudioCubit, AudioState>(
                                builder: (context, audioState) {
                                  return BlocBuilder<AdCubit, AdState>(
                                    builder: (context, adState) {
                                      return LoadingScreen(
                                        isLoading: authState is AuthLoading ||
                                            userState is UserLoading,
                                        size: MediaQuery.of(context).size,
                                        child: BaseScaffold(
                                          safeArea: true,
                                          body: HomeView(
                                            uid: authState.authEntity.id,
                                            devicePrefs:
                                                devicePrefsState.devicePrefs,
                                            // Null check operator used on a nul
                                            // WHEN REGISTERED
                                            user: userState.user!,
                                            adState: adState,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
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
          },
        );
      },
    );
  }
}
