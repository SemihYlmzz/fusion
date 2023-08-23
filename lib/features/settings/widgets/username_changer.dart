import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:fusion/shared/widgets/pop_ups/cant_rename_pop_up.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';
import '../../../shared/shared.dart';
import 'settings_bordered_button.dart';

class UsernameChanger extends StatelessWidget {
  const UsernameChanger({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        final month = userState.user!.accountnameChangeEligibilityDate
            .difference(DateTime.now());
        return SettingsBorderedButton(
          buttonText: AppLocalizations.of(context).username,
          buttonWidget: const Text('CL4Y'),
          onTap: () {
            if (month.isNegative) {
              openEnterNamePopUp(context, userState);
            } else {
              openCantRenamePopUp(context, userState);
            }
          },
        );
      },
    );
  }

  Future<void> openEnterNamePopUp(
    BuildContext context,
    UserState userState,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        if (devicePrefs.isHapticsOn) {
          HapticFeedback.heavyImpact();
        }

        return const EnterNamePopUp();
      },
    );
  }

  Future<void> openCantRenamePopUp(
    BuildContext context,
    UserState userState,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        if (devicePrefs.isHapticsOn) {
          HapticFeedback.heavyImpact();
        }

        return const CantRenamePopUp();
      },
    );
  }
}
