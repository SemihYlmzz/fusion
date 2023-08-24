import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/l10n/app_localizations.dart';
import 'package:shared_constants/shared_constants.dart';

import '../../../repositories/auth_repository/bloc/auth_bloc.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';

class UserLoadingView extends StatefulWidget {
  const UserLoadingView({
    required this.uid,
    super.key,
  });
  final String uid;

  @override
  State<UserLoadingView> createState() => _UserLoadingViewState();
}

class _UserLoadingViewState extends State<UserLoadingView> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      SharedDurations.ms1500,
      (timer) {
        context.read<UserBloc>().add(ReadWithUidRequested(widget.uid));
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: SharedPaddings.vertical16,
            child: TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthLogoutRequested());
              },
              child: Text(
                AppLocalizations.of(context).cancel,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
