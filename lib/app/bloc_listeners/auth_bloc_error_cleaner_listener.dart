import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../blocs/blocs.dart';

BlocListener<AuthBloc, AuthState> buildAuthBlocListener() {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, authState) {
      if (authState is! AuthHasError) {
        return;
      }

      if (authState.errorDisplayType == ErrorDisplayType.snackBar) {
        showSnackBar(
          context,
          authState.errorMessage!,
        );
      }
      if (authState.errorCleanType == ErrorCleanType.immediately) {
        context.read<AuthBloc>().add(const ClearAuthErrorMessageRequested());
      }
    },
  );
}
