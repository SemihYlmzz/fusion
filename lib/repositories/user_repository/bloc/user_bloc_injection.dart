import '../../../initialize/injection_container.dart';
import '../domain/usecase/usecases/change_username.dart';
import '../domain/usecase/usecases/read_user_with_uid.dart';
import '../domain/usecase/usecases/refresh_deck.dart';
import '../domain/usecase/usecases/watch_user_with_uid.dart';
import 'user_bloc.dart';

class UserBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<UserBloc>(
      () => UserBloc(
        readUserWithUidUseCase: getIt<ReadUserWithUidUseCase>(),
        changeUsernameUseCase: getIt<ChangeUsernameUseCase>(),
        refreshDeckUseCase: getIt<RefreshDeckUseCase>(),
        watchUserWithUidUseCase: getIt<WatchUserWithUidUseCase>(),

      ),
    );
  }
}
