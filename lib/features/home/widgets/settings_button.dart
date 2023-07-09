import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/config/style/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/auth_repository/bloc/auth_bloc.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  void openSettingsPopUp(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: SharedPaddings.horizontal32,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                color: AppColors.backgroundDark,
              ),
              height: 520,
              child: BaseColumn(
                children: [
                  Text(AppLocalizations.of(context).settings),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            const AuthLogoutRequested(),
                          );
                    },
                    child: Text(AppLocalizations.of(context).signOut),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // openSettingsPopUp(context);
        GoRouter.of(context).go('/home/settings');
      },
      icon: const Icon(Icons.settings),
      iconSize: 40,
    );
  }
}
