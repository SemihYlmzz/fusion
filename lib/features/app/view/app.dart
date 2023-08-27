import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fusion/config/app_router.dart';
import 'package:fusion/config/style/theme.dart';
import 'package:fusion/injection_container.dart';
import 'package:fusion/l10n/l10n.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:fusion/repositories/delete_request_repository/bloc/delete_request_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../audio/audio_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    final authBloc = getIt<AuthBloc>();
    final userBloc = getIt<UserBloc>();
    final devicePrefsBloc = getIt<DevicePrefsBloc>();
    final deleteRequestBloc = getIt<DeleteRequestBloc>();
    final audioCubit = getIt<AudioCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => authBloc),
        BlocProvider<UserBloc>(create: (_) => userBloc),
        BlocProvider<DevicePrefsBloc>(
          create: (_) => devicePrefsBloc..add(const ReadDevicePrefs()),
        ),
        BlocProvider<DeleteRequestBloc>(create: (_) => deleteRequestBloc),
        BlocProvider<AudioCubit>(create: (_) => audioCubit),
      ],
      child: BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
        builder: (context, devicePrefsState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            darkTheme: AppTheme.darkTheme,
            // theme: AppTheme.lightTheme,
            themeMode: ThemeMode.dark,
            routerConfig: router,
            builder: (_, router) {
              return MultiBlocListener(
                listeners: [
                  _buildAuthBlocListener(userBloc),
                  _buildUserBlocListener(),
                  _buildDeleteRequestBlocListener(),
                ],
                child: router!,
              );
            },
            supportedLocales: L10n.all,
            locale: Localization
                .languageCodeToLocale[devicePrefsState.devicePrefs.language],

            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
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
