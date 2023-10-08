import '../../../initialize/injection_container.dart';
import '../../repositories/delete/domain/usecase/usecases/create_delete_request.dart';
import 'delete_request_bloc.dart';

class DeleteRequestBlocInjection {
  static void inject() {
    // DeleteRequestBloc <-connection-> UseCases
    getIt.registerFactory<DeleteRequestBloc>(
      () => DeleteRequestBloc(
        createDeleteRequestUseCase: getIt<CreateDeleteRequestUseCase>(),
      ),
    );
  }
}
