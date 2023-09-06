import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../l10n/app_localizations.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import '../../../shared/shared.dart';
import '../../../utils/typedefs.dart';

class PrivacyAcceptButton extends StatelessWidget {
  const PrivacyAcceptButton({
    required this.onAccept,
    required this.isAcceptedPrivacy,
    super.key,
  });
  final BoolCallback onAccept;
  final bool isAcceptedPrivacy;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, devicePrefsState) {
        return Padding(
          padding: SharedPaddings.vertical8,
          child: Row(
            children: [
              Transform.scale(
                scale: 2,
                child: Checkbox(
                  value: isAcceptedPrivacy,
                  shape: const CircleBorder(),
                  onChanged: (val) {
                    onAccept(value: val ?? false);
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context).iAgreeToThe,
                      textAlign: TextAlign.center,
                    ),
                    GradientTextButton(
                      AppLocalizations.of(context).fusionPrivacyNotice,
                      maxLines: 2,
                      align: TextAlign.center,
                      onTap: () async {
                        await showBottomSheett(
                          const PrivacyBottomSheet(),
                          devicePrefsState.devicePrefs,
                          context,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> showBottomSheett(
    Widget bottomSheetWidget,
    DevicePrefs devicePrefs,
    BuildContext context,
  ) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          if (devicePrefs.isHapticsOn) {
            HapticFeedback.mediumImpact();
          }
          return bottomSheetWidget;
        },
      );
}
