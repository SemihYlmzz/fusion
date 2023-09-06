import '../../../initialize/injection_container.dart';
import '../domain/usecase/usecases/auth_entity.dart';
import '../domain/usecase/usecases/check_user_auth.dart';
import '../domain/usecase/usecases/log_in_with_apple.dart';
import '../domain/usecase/usecases/log_in_with_facebook.dart';
import '../domain/usecase/usecases/log_in_with_google.dart';
import '../domain/usecase/usecases/log_out.dart';
import 'auth_bloc.dart';

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
