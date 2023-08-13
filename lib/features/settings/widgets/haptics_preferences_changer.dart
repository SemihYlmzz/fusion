import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'settings_bordered_button.dart';

class HapticsPreferencesChanger extends StatelessWidget {
  const HapticsPreferencesChanger({
    required this.devicePrefs,
    super.key,
  });
  final DevicePrefs devicePrefs;

  @override
  Widget build(BuildContext context) {
    return SettingsBorderedButton(
      buttonText: AppLocalizations.of(context).haptics,
      buttonWidget: Switch.adaptive(
        value: devicePrefs.isHapticsOn,
        onChanged: (newValue) {
          context.read<DevicePrefsBloc>().add(
                UpdateDevicePrefs(
                  devicePrefs.copyWith(
                    isHapticsOn: newValue,
                  ),
                ),
              );
        },
      ),
    );
  }
}
