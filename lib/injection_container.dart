import 'package:fusion/repositories/auth_repository/auth_injection.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc_injection.dart';
import 'package:fusion/repositories/delete_request_repository/bloc/delete_request_bloc_injection.dart';
import 'package:fusion/repositories/delete_request_repository/delete_request_injection.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc_injection.dart';
import 'package:fusion/repositories/device_prefs_repository/device_prefs_repository_injection.dart';
import 'package:fusion/repositories/queue_repository/bloc/queue_bloc_injection.dart';
import 'package:fusion/repositories/queue_repository/queue_injection.dart';
import 'package:fusion/repositories/user_repository/bloc/user_bloc_injection.dart';
import 'package:fusion/repositories/user_repository/user_injection.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // BLOCS OF REPOSITORIES
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
  // -- Delete Request
  await DeleteRequestRepositoryInjection.inject();
  DeleteRequestBlocInjection.inject();
  // -- Queue
  await QueueRepositoryInjection.inject();
  QueueBlocInjection.inject();
}
