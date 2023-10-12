import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';

BlocListener<AuthBloc, AuthState> cleanUserOnUnauth(UserBloc userBloc) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, authState) {
      if (authState is! AuthUnAuthenticated) {
        return;
      }
      if (userBloc.state.userModel == null) {
        return;
      }

      userBloc.add(const ClearUserRequested());
    },
  );
}
