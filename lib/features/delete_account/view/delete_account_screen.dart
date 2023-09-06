import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../repositories/auth_repository/bloc/auth_bloc.dart';
import '../../../repositories/delete_request_repository/bloc/delete_request_bloc.dart';
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
    context.read<DeleteRequestBloc>().add(const CreateDeleteRequestRequested());

    return BlocBuilder<DeleteRequestBloc, DeleteRequestState>(
      builder: (context, deleteRequestState) {
        if (deleteRequestState is DeleteRequestHasData) {
          context.read<AuthBloc>().add(const AuthLogoutRequested());
        }
        if (deleteRequestState.errorMessage != null) {
          context.goNamed(HomeScreen.name);
        }
        return const BaseScaffold(
          body: Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
