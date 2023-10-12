import 'package:audioplayers/audioplayers.dart';
import 'package:fusion/app/cubits/cubits.dart';
import 'package:fusion/app/gen/l10n/l10n.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../blocs/blocs.dart';
import '../repositories/repositories.dart';

final getIt = GetIt.instance;

class InjectionContainer {
  static Future<void> initializeDependencies() async {
    getIt
      //! External
      //
      // -- Internet Connection Checker
      ..registerLazySingleton<InternetConnectionChecker>(
        InternetConnectionChecker.new,
      )
      // -- Localization
      ..registerSingleton(L10n())
      //! CORE
      //
      // -- Network Info
      ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
      )
      //! CUBITS
      ..registerLazySingleton(AdCubit.new)
      ..registerLazySingleton(
        () => PreloadCubit(
          bgmAudioCache: AudioCache(prefix: ''),
          sfxAudioCache: AudioCache(prefix: ''),
        ),
      )
      ..registerLazySingleton(
        () => AudioCubit(
          bgmAudioCache: getIt<PreloadCubit>().bgmAudioCache,
          sfxAudioCache: getIt<PreloadCubit>().sfxAudioCache,
        ),
      );

    //! BLOCS OF REPOSITORIES
    //
    // -- Auth
    await AuthRepositoryInjection.inject();
    AuthBlocInjection.inject();
    // -- User
    await UserRepositoryInjection.inject();
    UserBlocInjection.inject();
    // -- Device Preferences
    await DevicePrefsRepositoryInjection.inject();
    DevicePrefsBlocInjection.inject();
    // -- Card
    await CardRepositoryInjection.inject();
    CardBlocInjection.inject();
    // -- Delete Request
    await DeleteRequestRepositoryInjection.inject();
    DeleteRequestBlocInjection.inject();
    // -- Queue
    await QueueRepositoryInjection.inject();
    QueueBlocInjection.inject();
  }
}
