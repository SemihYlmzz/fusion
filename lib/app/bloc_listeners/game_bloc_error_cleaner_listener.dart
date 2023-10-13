import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../blocs/blocs.dart';

BlocListener<GameBloc, GameState> buildGameBlocListener() {
  return BlocListener<GameBloc, GameState>(
    listener: (context, gameState) {
      if (gameState is! GameHasError) {
        return;
      }
      if (gameState.errorDisplayType == ErrorDisplayType.snackBar) {
        showSnackBar(
          context,
          gameState.errorMessage!,
        );
      }
      if (gameState.errorCleanType == ErrorCleanType.immediately) {
        context.read<GameBloc>().add(const ClearGameErrorMessageRequested());
      }
    },
  );
}
