import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../blocs/blocs.dart';
import '../initialize/injection_container.dart';
import 'bloc_listeners/bloc_listeners.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
        BlocProvider<UserBloc>(create: (_) => getIt<UserBloc>()),
        BlocProvider<DevicePrefsBloc>(
          create: (_) => getIt<DevicePrefsBloc>()..add(const ReadDevicePrefs()),
        ),
        BlocProvider<CardBloc>(create: (_) => getIt<CardBloc>()),
        BlocProvider<DeleteRequestBloc>(
          create: (_) => getIt<DeleteRequestBloc>(),
        ),
        BlocProvider<QueueBloc>(create: (_) => getIt<QueueBloc>()),
        BlocProvider<PreloadCubit>(create: (_) => getIt<PreloadCubit>()),
        BlocProvider<AdCubit>(create: (_) => getIt<AdCubit>()),
        BlocProvider<AudioCubit>(create: (_) => getIt<AudioCubit>()),
        BlocProvider<GameBloc>(create: (_) => getIt<GameBloc>()),
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
                  buildAuthBlocListener(),
                  buildUserBlocListener(),
                  buildDeleteRequestBlocListener(),
                  buildQueueBlocListener(),
                  buildCardBlocListener(),
                  buildDevicePrefsBlocListener(),
                  buildAdCubitListener(),
                  audioCubitPrefsConnection(getIt<AudioCubit>()),
                  buildGameBlocListener(),
                ],
                child: Builder(
                  builder: (builderContext) {
                    final auth = builderContext.watch<AuthBloc>().state;
                    final user = builderContext.watch<UserBloc>().state;
                    final deleteRequest =
                        builderContext.watch<DeleteRequestBloc>().state;
                    final ad = builderContext.watch<AdCubit>().state;

                    return LoadingScreen(
                      isLoading: auth is AuthLoading ||
                          user is UserLoading ||
                          devicePrefsState is DevicePrefsLoading ||
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
}

Future<void> showSnackBar(
  BuildContext context,
  String errorMessage,
) async {
  final isErrorMessageEmpty = errorMessage == '';
  await Future<void>.delayed(SharedDurations.ms200);

  if (context.mounted && !isErrorMessageEmpty) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
  }
}
