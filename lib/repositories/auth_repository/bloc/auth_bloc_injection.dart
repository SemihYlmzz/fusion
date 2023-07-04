import 'package:fusion/injection_container.dart';
import 'package:fusion/repositories/auth_repository/bloc/auth_bloc.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/auth_entity.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/check_user_auth.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/log_in_with_apple.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/log_in_with_facebook.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/log_in_with_google.dart';
import 'package:fusion/repositories/auth_repository/domain/usecase/usecases/log_out.dart';

class AuthBlocInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(
        authEntityUseCase: getIt<AuthEntityUseCase>(),
        logOutUseCase: getIt<LogOutUseCase>(),
        checkUserAuthUseCase: getIt<CheckUserAuthUseCase>(),
        loginWithGoogleUseCase: getIt<LoginWithGoogleUseCase>(),
        loginWithAppleUseCase: getIt<LoginWithAppleUseCase>(),
        loginWithFacebookUseCase: getIt<LoginWithFacebookUseCase>(),
      ),
    );
  }
}
