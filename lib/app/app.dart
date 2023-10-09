import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_constants/shared_constants.dart';

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
                child: router!,
              );
            },
            supportedLocales: L10n.delegate.supportedLocales,
            locale: Localization
                .languageCodeToLocale[devicePrefsState.devicePrefs.language],
            //  localeResolutionCallback: (deviceLocale, supportedLocales) {
            //  return const Locale('en', 'EN');
            //  // if (supportedLocales
            //  //     .map((e) => e.languageCode)
            //  //     .contains(deviceLocale?.languageCode)) {
            //  //   return deviceLocale;
            //  // } else {
            //  //   return const Locale('tr', 'TR');
            //  // }
            //  },
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
      listener: (context, state) {
        if (state is AuthHasError) {
          _showSnackBar(context, state.errorMessage!);

          context.read<AuthBloc>().add(const ClearAuthErrorMessageRequested());
        } else if (state is AuthAuthenticated) {
          if (userBloc.state is! UserHasData) {
            userBloc.add(ReadWithUidRequested(state.authEntity.id));
          }
        }
      },
    );
  }

  BlocListener<UserBloc, UserState> _buildUserBlocListener() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserHasError) {
          _showSnackBar(context, state.errorMessage!);
          context.read<UserBloc>().add(const ClearUserErrorMessageRequested());
        }
      },
    );
  }

  BlocListener<DeleteRequestBloc, DeleteRequestState>
      _buildDeleteRequestBlocListener() {
    return BlocListener<DeleteRequestBloc, DeleteRequestState>(
      listener: (context, state) {
        if (state is DeleteRequestHasError) {
          _showSnackBar(context, state.errorMessage!);
          context
              .read<DeleteRequestBloc>()
              .add(const ClearDeleteRequestErrorMessageRequested());
        }
      },
    );
  }

  BlocListener<QueueBloc, QueueState> _buildQueueBlocListener() {
    return BlocListener<QueueBloc, QueueState>(
      listener: (context, state) {
        if (state is QueueHasError) {
          _showSnackBar(context, state.errorMessage!).whenComplete(
            () => context
                .read<QueueBloc>()
                .add(const ClearQueueErrorMessageRequested()),
          );
        }
      },
    );
  }

  BlocListener<CardBloc, CardState> _buildCardBlocListener() {
    return BlocListener<CardBloc, CardState>(
      listener: (context, state) {
        if (state is CardHasError) {
          _showSnackBar(context, state.errorMessage!);
        }
      },
    );
  }

  BlocListener<DevicePrefsBloc, DevicePrefsState>
      _buildDevicePrefsBlocListener() {
    return BlocListener<DevicePrefsBloc, DevicePrefsState>(
      listener: (context, state) {
        if (state is DevicePrefsHasError) {
          _showSnackBar(context, state.errorMessage!);
          context
              .read<DevicePrefsBloc>()
              .add(const ClearDevicePrefsErrorMessage());
        }
      },
    );
  }

  Future<void> _showSnackBar(BuildContext context, String errorMessage) async {
    final isErrorMessageEmpty = errorMessage == '';
    await Future<void>.delayed(SharedDurations.ms200);

    if (mounted && !isErrorMessageEmpty) {
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
