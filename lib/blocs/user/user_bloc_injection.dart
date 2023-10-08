import '../../../initialize/injection_container.dart';

import '../../repositories/repositories.dart';
import 'user_bloc.dart';

class UserBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<UserBloc>(
      () => UserBloc(
        userRepository: getIt<UserRepository>(),
      ),
    );
  }
}
