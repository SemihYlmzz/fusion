import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';

class UsernameText extends StatelessWidget {
  const UsernameText({super.key});
  @override
  Widget build(BuildContext context) {
    final username = context.select((UserBloc userBloc) {
      return userBloc.state.userModel?.username;
    });
    return username != null ? Text(username) : const SizedBox();
  }
}
