import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/l10n/app_localizations.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

class SaveAcceptenceButton extends StatelessWidget {
  const SaveAcceptenceButton({
    required this.isReadyToAccept,
    super.key,
  });
  final bool isReadyToAccept;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, devicePrefsState) {
        return GradientButton(
          width: 200,
          text: AppLocalizations.of(context).acceptText,
          onPressed: !isReadyToAccept
              ? null
              : () {
                  context.read<DevicePrefsBloc>().add(
                        UpdateDevicePrefs(
                          devicePrefsState.devicePrefs.copyWith(
                            isTermsAndConditionsAccepted: true,
                          ),
                        ),
                      );
                },
        );
      },
    );
  }
}
