import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../blocs/blocs.dart';

BlocListener<UserBloc, UserState> buildUserBlocListener() {
  return BlocListener<UserBloc, UserState>(
    listener: (context, userState) {
      if (userState is! UserHasError) {
        return;
      }
      if (userState.errorDisplayType == ErrorDisplayType.snackBar) {
        showSnackBar(
          context,
          userState.errorMessage!,
        );
      }
      if (userState.errorCleanType == ErrorCleanType.immediately) {
        context.read<UserBloc>().add(const ClearUserErrorMessageRequested());
      }
    },
  );
}
