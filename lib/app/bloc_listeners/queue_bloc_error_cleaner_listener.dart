import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../blocs/blocs.dart';

BlocListener<QueueBloc, QueueState> buildQueueBlocListener() {
  return BlocListener<QueueBloc, QueueState>(
    listener: (context, queueState) {
      if (queueState is! QueueHasError) {
        return;
      }

      if (queueState.errorDisplayType == ErrorDisplayType.snackBar) {
        showSnackBar(
          context,
          queueState.errorMessage!,
        );
      }

      if (queueState.errorCleanType == ErrorCleanType.immediately) {
        context.read<QueueBloc>().add(const ClearQueueErrorMessageRequested());
      }
    },
  );
}
