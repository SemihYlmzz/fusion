import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/features/settings/widgets/enter_name_pop_up.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/user_repository/bloc/user_bloc.dart';
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
        return SettingsBorderedButton(
          buttonText: AppLocalizations.of(context).username,
          buttonWidget: const Text('CL4Y'),
          onTap: () => openEnterNamePopUp(context, userState),
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
}
