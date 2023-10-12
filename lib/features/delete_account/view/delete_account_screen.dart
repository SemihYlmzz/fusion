import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../blocs/blocs.dart';
import '../../home/view/view.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({
    super.key,
  });
  static const String path = '/delete_account';
  static const String name = 'delete_account';

  static const double settingsBoxWidth = 320;
  static const double settingsCardWidth = 300;
  static const double settingsBoxHeight = 600;
  static const double settingsCardHeight = 570;

  @override
  Widget build(BuildContext context) {
    context.read<DeleteRequestBloc>().add(
          const CreateDeleteRequestRequested(
            errorCleanType: ErrorCleanType.onUserEvent,
            errorDisplayType: ErrorDisplayType.none,
          ),
        );
    final deleteRequestState = context.watch<DeleteRequestBloc>().state;
    if (deleteRequestState is DeleteRequestHasError) {
      showSnackBar(context, deleteRequestState.errorMessage!);
      context
          .read<DeleteRequestBloc>()
          .add(const ClearDeleteRequestErrorMessageRequested());
      context.goNamed(HomeScreen.name);
    }
    if (deleteRequestState is DeleteRequestHasData) {
      context.read<AuthBloc>().add(
            const AuthLogoutRequested(
              errorCleanType: ErrorCleanType.onUserEvent,
            ),
          );
    }

    return BaseScaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              return authState is! AuthHasError
                  ? Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  const ClearAuthErrorMessageRequested(),
                                );
                            context.read<AuthBloc>().add(
                                  const AuthLogoutRequested(
                                    errorCleanType: ErrorCleanType.onUserEvent,
                                  ),
                                );
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
