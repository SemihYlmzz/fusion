import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../blocs/blocs.dart';

BlocListener<AuthBloc, AuthState> watchUserOnAuth(UserBloc userBloc) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, authState) {
      if (authState is! AuthAuthenticated) {
        return;
      }
      if (userBloc.state is UserHasData || userBloc.state is UserLoading) {
        return;
      }
      
      userBloc.add(
        const WatchWithUidRequested(
          errorDisplayType: ErrorDisplayType.none,
        ),
      );
    },
  );
}
