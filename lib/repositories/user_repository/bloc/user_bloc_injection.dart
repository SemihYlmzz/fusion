import 'package:fusion/repositories/user_repository/domain/usecase/usecases/change_username.dart';
import 'package:fusion/repositories/user_repository/domain/usecase/usecases/refresh_deck.dart';

import '../../../injection_container.dart';

import '../domain/usecase/usecases/create_user.dart';
import '../domain/usecase/usecases/delete_user.dart';
import '../domain/usecase/usecases/read_user_with_uid.dart';
import '../domain/usecase/usecases/update_user_with_uid.dart';
import '../domain/usecase/usecases/watch_user_with_uid.dart';
import 'user_bloc.dart';

class UserBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<UserBloc>(
      () => UserBloc(
        createUserUseCase: getIt<CreateUserUseCase>(),
        deleteUserUseCase: getIt<DeleteUserUseCase>(),
        readUserWithUidUseCase: getIt<ReadUserWithUidUseCase>(),
        updateUserWithUidUseCase: getIt<UpdateUserWithUidUseCase>(),
        changeUsernameUseCase: getIt<ChangeUsernameUseCase>(),
        refreshDeckUseCase: getIt<RefreshDeckUseCase>(),
        watchUserWithUidUseCase: getIt<WatchUserWithUidUseCase>(),

      ),
    );
  }
}
