import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../blocs/blocs.dart';

BlocListener<CardBloc, CardState> buildCardBlocListener() {
  return BlocListener<CardBloc, CardState>(
    listener: (context, cardState) {
      if (cardState is! CardHasError) {
        return;
      }

      if (cardState.errorDisplayType == ErrorDisplayType.snackBar) {
        showSnackBar(
          context,
          cardState.errorMessage!,
        );
      }
      if (cardState.errorCleanType == ErrorCleanType.immediately) {
        context.read<CardBloc>().add(const ClearCardErrorMessageRequested());
      }
    },
  );
}
