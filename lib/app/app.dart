import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../blocs/blocs.dart';
import '../initialize/injection_container.dart';
import 'cubits/cubits.dart';
import 'gen/l10n/l10n.dart';
import 'router/app_router.dart';
import 'theme/theme.dart';

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
    final cardBloc = getIt<CardBloc>();
    final deleteRequestBloc = getIt<DeleteRequestBloc>();
    final queueBloc = getIt<QueueBloc>();

    // CUBITS
    final preloadCubit = PreloadCubit(
      bgmAudioCache: AudioCache(prefix: ''),
      sfxAudioCache: AudioCache(prefix: ''),
    );
    final adCubit = AdCubit();
    final audioCubit = AudioCubit(
      bgmAudioCache: preloadCubit.bgmAudioCache,
      sfxAudioCache: preloadCubit.sfxAudioCache,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => authBloc),
        BlocProvider<UserBloc>(create: (_) => userBloc),
        BlocProvider<DevicePrefsBloc>(create: (_) => devicePrefsBloc),
        BlocProvider<CardBloc>(create: (_) => cardBloc),
        BlocProvider<DeleteRequestBloc>(create: (_) => deleteRequestBloc),
        BlocProvider<QueueBloc>(create: (_) => queueBloc),
        BlocProvider<PreloadCubit>(create: (_) => preloadCubit),
        BlocProvider<AudioCubit>(create: (_) => audioCubit),
        BlocProvider<AdCubit>(create: (_) => adCubit),
      ],
      child: BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
        builder: (context, devicePrefsState) {
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
                  _buildQueueBlocListener(),
                  _buildCardBlocListener(),
                  _buildDevicePrefsBlocListener(),
                ],
                child: Builder(
                  builder: (builderContext) {
                    final auth = builderContext.watch<AuthBloc>().state;
                    final user = builderContext.watch<UserBloc>().state;
                    final deleteRequest =
                        builderContext.watch<DeleteRequestBloc>().state;
                    final queue = builderContext.watch<QueueBloc>().state;
                    final ad = builderContext.watch<AdCubit>().state;
                    return LoadingScreen(
                      isLoading: auth is AuthLoading ||
                          (user is UserLoading) ||
                          devicePrefsState is DevicePrefsLoading ||
                          queue is QueueLoading ||
                          deleteRequest is DeleteRequestLoading ||
                          ad.isLoadingAd,
                      size: MediaQuery.of(builderContext).size,
                      child: router!,
                    );
                  },
                ),
              );
            },
            supportedLocales: L10n.delegate.supportedLocales,
            locale: Localization
                .languageCodeToLocale[devicePrefsState.devicePrefs.language],
            localizationsDelegates: const [
              L10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }

  BlocListener<AuthBloc, AuthState> _buildAuthBlocListener(UserBloc userBloc) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is AuthHasError) {
          _showSnackBar(
            context,
            authState.errorMessage!,
            authState.errorDisplayType,
          );

          if (authState.errorCleanType == ErrorCleanType.afterDisplay) {
            context
                .read<AuthBloc>()
                .add(const ClearAuthErrorMessageRequested());
          }
        } else if (authState is AuthAuthenticated) {
          if (userBloc.state is! UserHasData) {
            userBloc.add(
              ReadWithUidRequested(
                uid: authState.authEntity.id,
                errorDisplayType: ErrorDisplayType.none,
              ),
            );
          }
        }
        if (authState is AuthUnAuthenticated &&
            userBloc.state.userModel != null) {
          userBloc.add(const ClearUserRequested());
        }
      },
    );
  }

  BlocListener<UserBloc, UserState> _buildUserBlocListener() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, userState) {
        if (userState is UserHasError) {
          _showSnackBar(
            context,
            userState.errorMessage!,
            userState.errorDisplayType,
          );
          if (userState.errorCleanType == ErrorCleanType.afterDisplay) {
            context
                .read<UserBloc>()
                .add(const ClearUserErrorMessageRequested());
          }
        }
      },
    );
  }

  BlocListener<DeleteRequestBloc, DeleteRequestState>
      _buildDeleteRequestBlocListener() {
    return BlocListener<DeleteRequestBloc, DeleteRequestState>(
      listener: (context, deleteRequestState) {
        if (deleteRequestState is DeleteRequestHasError) {
          _showSnackBar(
            context,
            deleteRequestState.errorMessage!,
            deleteRequestState.errorDisplayType,
          );
          context
              .read<DeleteRequestBloc>()
              .add(const ClearDeleteRequestErrorMessageRequested());
        }
      },
    );
  }

  BlocListener<QueueBloc, QueueState> _buildQueueBlocListener(

  ) {
    return BlocListener<QueueBloc, QueueState>(
      listener: (context, queueState) {
        // Error handler
        //
        if (queueState is QueueHasError) {
          _showSnackBar(
            context,
            queueState.errorMessage!,
            queueState.errorDisplayType,
          );
          if (queueState.errorCleanType == ErrorCleanType.afterDisplay) {
            context
                .read<QueueBloc>()
                .add(const ClearQueueErrorMessageRequested());
          }
        }
      },
    );
  }

  BlocListener<CardBloc, CardState> _buildCardBlocListener() {
    return BlocListener<CardBloc, CardState>(
      listener: (context, cardState) {
        if (cardState is CardHasError) {
          _showSnackBar(
            context,
            cardState.errorMessage!,
            cardState.errorDisplayType,
          );
          if (cardState.errorCleanType == ErrorCleanType.afterDisplay) {
            context
                .read<CardBloc>()
                .add(const ClearCardErrorMessageRequested());
          }
        }
      },
    );
  }

  BlocListener<DevicePrefsBloc, DevicePrefsState>
      _buildDevicePrefsBlocListener() {
    return BlocListener<DevicePrefsBloc, DevicePrefsState>(
      listener: (context, devicePrefsState) {
        if (devicePrefsState is DevicePrefsHasError) {
          _showSnackBar(
            context,
            devicePrefsState.errorMessage!,
            devicePrefsState.errorDisplayType,
          );
          if (devicePrefsState.errorCleanType == ErrorCleanType.afterDisplay) {
            context
                .read<DevicePrefsBloc>()
                .add(const ClearDevicePrefsErrorMessage());
          }
        }

        if (devicePrefsState is DevicePrefsReaded) {
          context.read<AudioCubit>().connectDevicePrefs(
                devicePrefsState.devicePrefs.backGroundSoundVolume,
                devicePrefsState.devicePrefs.dialogsSoundVolume,
                devicePrefsState.devicePrefs.generalSoundVolume,
                devicePrefsState.devicePrefs.soundEffectsSoundVolume,
              );
        }
      },
    );
  }

  Future<void> _showSnackBar(
    BuildContext context,
    String errorMessage,
    ErrorDisplayType errorDisplayType,
  ) async {
    final isErrorMessageEmpty = errorMessage == '';
    final isShowtypeSnackBar = errorDisplayType == ErrorDisplayType.snackBar;
    await Future<void>.delayed(SharedDurations.ms200);

    if (mounted && !isErrorMessageEmpty && isShowtypeSnackBar) {
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
