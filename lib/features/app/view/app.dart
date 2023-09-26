import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fusion/network/network_cubit.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../ad/ad.dart';
import '../../../audio/audio_cubit.dart';
import '../../../config/app_router.dart';
import '../../../config/style/theme.dart';
import '../../../initialize/injection_container.dart';
import '../../../l10n/l10n.dart';
import '../../../preload/preload_cubit.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';
import '../../../repositories/delete_request_repository/bloc/delete_request_bloc.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/queue_repository/bloc/queue_bloc.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';

class App extends StatefulWidget {
  const App({required this.flavor, super.key});
  final String flavor;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    // BLOCS
    final authBloc = getIt<AuthBloc>();
    final userBloc = getIt<UserBloc>();
    final devicePrefsBloc = getIt<DevicePrefsBloc>()
      ..add(const ReadDevicePrefs());
    final deleteRequestBloc = getIt<DeleteRequestBloc>();
    final queueBloc = getIt<QueueBloc>();

    // CUBITS
    final preloadCubit = PreloadCubit(
      bgmAudioCache: AudioCache(prefix: ''),
      sfxAudioCache: AudioCache(prefix: ''),
    );
    final adCubit = AdCubit()..onLoadRewardedAdRequested();
    final audioCubit = AudioCubit(
      bgmAudioCache: preloadCubit.bgmAudioCache,
      sfxAudioCache: preloadCubit.sfxAudioCache,
    );
    final networkCubit = NetworkCubit()..listenConnectionStatus();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => authBloc),
        BlocProvider<UserBloc>(create: (_) => userBloc),
        BlocProvider<DevicePrefsBloc>(create: (_) => devicePrefsBloc),
        BlocProvider<DeleteRequestBloc>(create: (_) => deleteRequestBloc),
        BlocProvider<QueueBloc>(create: (_) => queueBloc),
        BlocProvider<PreloadCubit>(create: (_) => preloadCubit),
        BlocProvider<AudioCubit>(create: (_) => audioCubit),
        BlocProvider<AdCubit>(create: (_) => adCubit),
        BlocProvider<NetworkCubit>(create: (_) => networkCubit),
      ],
      child: BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
        builder: (context, devicePrefsState) {
          return BlocBuilder<NetworkCubit, NetworkState>(
            builder: (context, networkState) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeMode.dark,
                routerConfig: router,
                builder: (_, router) {
                  return MultiBlocListener(
                    listeners: [
                      _buildAuthBlocListener(userBloc),
                      _buildUserBlocListener(),
                      _buildDeleteRequestBlocListener(),
                      _adBlocListener(networkState),
                      _networkBlocListener(),
                    ],
                    child: NoNetworkScreen(
                      isLoading: !networkState.hasConnection,
                      size: MediaQuery.sizeOf(context),
                      child: router!,
                    ),
                  );
                },
                supportedLocales: L10n.all,
                locale: Localization.languageCodeToLocale[
                    devicePrefsState.devicePrefs.language],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
              );
            },
          );
        },
      ),
    );
  }

  BlocListener<AuthBloc, AuthState> _buildAuthBlocListener(UserBloc userBloc) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          _showSnackBar(context, state.errorMessage!);
        } else if (state is AuthAuthenticated) {
          userBloc.add(ReadWithUidRequested(state.authEntity.id));
        }
      },
    );
  }

  BlocListener<UserBloc, UserState> _buildUserBlocListener() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          _showSnackBar(context, state.errorMessage!);
        }
      },
    );
  }

  BlocListener<DeleteRequestBloc, DeleteRequestState>
      _buildDeleteRequestBlocListener() {
    return BlocListener<DeleteRequestBloc, DeleteRequestState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          _showSnackBar(context, state.errorMessage!);
        }
      },
    );
  }

  BlocListener<AdCubit, AdState> _adBlocListener(
    NetworkState currentNetworkState,
  ) {
    return BlocListener<AdCubit, AdState>(
      listener: (context, state) async {
        if (!currentNetworkState.hasConnection) {
          return;
        }
        final canLoadAd =
            state.retryLoadAdDate?.isBefore(DateTime.now()) ?? true;

        if (state.errorMessage != null) {
          await _showSnackBar(context, state.errorMessage!);
        }
        if (!state.isLoadingAd && state.rewardedAd == null && canLoadAd) {
          await Future<void>.delayed(SharedDurations.ms200);
          if (mounted) {
            await context.read<AdCubit>().onLoadRewardedAdRequested();
          }
        }
      },
    );
  }

  BlocListener<NetworkCubit, NetworkState> _networkBlocListener() {
    return BlocListener<NetworkCubit, NetworkState>(
      listener: (context, state) async {},
    );
  }

  Future<void> _showSnackBar(BuildContext context, String errorMessage) async {
    await Future<void>.delayed(SharedDurations.ms200);

    if (mounted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
    }
  }
}
