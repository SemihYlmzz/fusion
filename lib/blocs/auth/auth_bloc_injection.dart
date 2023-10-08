import 'package:fusion/repositories/repositories.dart';

import '../../../initialize/injection_container.dart';

import 'auth_bloc.dart';

class AuthBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(
        authRepository: getIt<AuthRepository>(),
      ),
    );
  }
}
