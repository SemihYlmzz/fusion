import 'package:fusion/app/l10n/l10n.dart';
import 'package:fusion/core/network/network_info.dart';
import 'package:fusion/repositories/card_repository/card_repository_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../blocs/blocs.dart';
import '../repositories/auth_repository/auth_injection.dart';
import '../repositories/delete_request_repository/delete_request_injection.dart';
import '../repositories/device_prefs_repository/device_prefs_repository_injection.dart';
import '../repositories/queue_repository/queue_injection.dart';
import '../repositories/user_repository/user_injection.dart';

final getIt = GetIt.instance;

class InjectionContainer {
  static Future<void> initializeDependencies() async {
    getIt
      //! External
      //
      // Internet Connection Checker
      ..registerLazySingleton<InternetConnectionChecker>(
        InternetConnectionChecker.new,
      )
      ..registerLazySingleton<L10n>(L10n.new)
      //! CORE
      //
      // -- Network Info
      ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
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
