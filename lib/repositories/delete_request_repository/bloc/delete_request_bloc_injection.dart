import '../../../initialize/injection_container.dart';
import '../domain/usecase/usecases/cancel_delete_request.dart';
import '../domain/usecase/usecases/check_delete_request.dart';
import '../domain/usecase/usecases/create_delete_request.dart';
import 'delete_request_bloc.dart';

class DeleteRequestBlocInjection {
  static void inject() {
    // DeleteRequestBloc <-connection-> UseCases
    getIt.registerFactory<DeleteRequestBloc>(
      () => DeleteRequestBloc(
        cancelDeleteRequestUseCase: getIt<CancelDeleteRequestUseCase>(),
        checkDeleteRequestUseCase: getIt<CheckDeleteRequestUseCase>(),
        createDeleteRequestUseCase: getIt<CreateDeleteRequestUseCase>(),
      ),
    );
  }
}
