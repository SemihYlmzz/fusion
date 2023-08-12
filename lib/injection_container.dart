import 'package:fusion/repositories/auth_repository/auth_injection.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc_injection.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc_injection.dart';
import 'package:fusion/repositories/device_prefs_repository/device_prefs_repository_injection.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc_injection.dart';
import 'package:fusion/repositories/user_repository/user_injection.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // REPOSITORIES SHOULD INJECT BEFORE BLOCS
  // REPOSITORY INJECTIONS
  await AuthRepositoryInjection.inject();
  await UserRepositoryInjection.inject();
  await DevicePrefsRepositoryInjection.inject();

  // BLOCS OF REPOSITORIES
  //
  // -- Auth
  AuthBlocInjection.inject();
  // -- User
  UserBlocInjection.inject();
  // -- Device Preferences
  DevicePrefsBlocInjection.inject();
}
