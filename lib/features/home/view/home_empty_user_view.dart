import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/core/enums/error_display_type.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../blocs/blocs.dart';

class HomeEmptyUserView extends StatefulWidget {
  const HomeEmptyUserView({
    super.key,
  });

  @override
  State<HomeEmptyUserView> createState() => _HomeEmptyUserViewState();
}

class _HomeEmptyUserViewState extends State<HomeEmptyUserView> {
  late AuthState authState;
  late Timer _timer;
  int _counter = 0;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter++;

      if (_counter == 6 || _counter == 12) {
        context.read<UserBloc>().add(
              const WatchWithUidRequested(
                errorDisplayType: ErrorDisplayType.none,
              ),
            );
      }
      if (_counter > 12) {
        _timer.cancel();
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    authState = context.watch<AuthBloc>().state;

    return BaseScaffold(
      body: Center(
        child: _counter < 13
            ? const CircularProgressIndicator()
            : BaseColumn(
                children: [
                  const SizedBox(),
                  const Text('Error occured while reading your User data.'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: const Text('Log Out'),
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                const AuthLogoutRequested(),
                              );
                        },
                      ),
                      TextButton(
                        child: const Text('Read Again'),
                        onPressed: () {
                          context.read<UserBloc>().add(
                                const WatchWithUidRequested(
                                  errorDisplayType: ErrorDisplayType.none,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
