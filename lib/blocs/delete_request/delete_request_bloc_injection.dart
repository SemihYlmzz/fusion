import 'package:fusion/repositories/delete_request/delete_request_repository.dart';

import '../../../initialize/injection_container.dart';
import 'delete_request_bloc.dart';

class DeleteRequestBlocInjection {
  static void inject() {
    // DeleteRequestBloc <-connection-> UseCases
    getIt.registerFactory<DeleteRequestBloc>(
      () => DeleteRequestBloc(
        deleteRequestRepository: getIt<DeleteRequestRepository>(),
      ),
    );
  }
}
