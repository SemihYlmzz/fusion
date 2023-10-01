import '../../initialize/injection_container.dart';
import 'data/datasource/auth_datasource.dart';
import 'data/datasource/auth_datasource_firebase_impl.dart';
import 'data/repository/auth_repository_impl.dart';
import 'domain/repository/auth_repository.dart';
import 'domain/usecase/usecases/auth_entity.dart';
import 'domain/usecase/usecases/check_user_auth.dart';
import 'domain/usecase/usecases/log_in_with_apple.dart';
import 'domain/usecase/usecases/log_in_with_facebook.dart';
import 'domain/usecase/usecases/log_in_with_google.dart';
import 'domain/usecase/usecases/log_out.dart';

class AuthRepositoryInjection {
  static Future<void> inject() async {
    // UserDataSource <-connection-> Firebase
    getIt
      ..registerSingleton<AuthDatasource>(AuthDatasourceFirebaseImpl())
      ..registerSingleton<AuthRepository>(AuthRepositoryImpl(getIt(), getIt()))
      ..registerSingleton<AuthEntityUseCase>(
        AuthEntityUseCase(
          authRepository: getIt<AuthRepository>(),
        ),
      )
      ..registerSingleton<LoginWithGoogleUseCase>(
        LoginWithGoogleUseCase(
          authRepository: getIt<AuthRepository>(),
        ),
      )
      ..registerLazySingleton<CheckUserAuthUseCase>(
        () => CheckUserAuthUseCase(authRepository: getIt<AuthRepository>()),
      )
      ..registerSingleton<LogOutUseCase>(
        LogOutUseCase(
          authRepository: getIt<AuthRepository>(),
        ),
      )
      ..registerLazySingleton<LoginWithAppleUseCase>(
        () => LoginWithAppleUseCase(authRepository: getIt<AuthRepository>()),
      )
      ..registerLazySingleton<LoginWithFacebookUseCase>(
        () => LoginWithFacebookUseCase(authRepository: getIt<AuthRepository>()),
      );
  }
}
