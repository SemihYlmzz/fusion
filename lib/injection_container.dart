import 'package:fusion/repositories/auth_repository/auth_injection.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc_injection.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // REPOSITORIES SHOULD INJECT BEFORE BLOCS
  // REPOSITORY INJECTIONS
  await AuthRepositoryInjection.inject();

  // BLOCS OF REPOSITORIES
  //
  // -- Auth
  AuthBlocInjection.inject();
}
