import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../blocs/blocs.dart';

BlocListener<DeleteRequestBloc, DeleteRequestState>
    buildDeleteRequestBlocListener() {
  return BlocListener<DeleteRequestBloc, DeleteRequestState>(
    listener: (context, deleteRequestState) {
      if (deleteRequestState is! DeleteRequestHasError) {
        return;
      }
      if (deleteRequestState.errorDisplayType == ErrorDisplayType.snackBar) {
        showSnackBar(
          context,
          deleteRequestState.errorMessage!,
        );
      }
      if (deleteRequestState.errorCleanType == ErrorCleanType.immediately) {
        context
            .read<DeleteRequestBloc>()
            .add(const ClearDeleteRequestErrorMessageRequested());
      }
    },
  );
}
