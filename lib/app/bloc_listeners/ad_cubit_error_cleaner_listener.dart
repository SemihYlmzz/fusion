import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';

import './../cubits/cubits.dart';

BlocListener<AdCubit, AdState> buildAdCubitListener() {
  return BlocListener<AdCubit, AdState>(
    listener: (context, adState) {
      if (adState.errorMessage != null) {
        showSnackBar(
          context,
          adState.errorMessage!,
        );
        context.read<AdCubit>().clearErrorMessage();
      }
    },
  );
}
