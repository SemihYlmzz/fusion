import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../app/l10n/l10n.dart';
import '../../../app/widgets/widgets.dart';
import '../../../core/typedefs/typedefs.dart';
import '../../../repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import '../../../repositories/device_prefs_repository/domain/entities/device_prefs.dart';

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
                      context.l10n.iAgreeToThe,
                      textAlign: TextAlign.center,
                    ),
                    GradientTextButton(
                      context.l10n.fusionPrivacyNotice,
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
