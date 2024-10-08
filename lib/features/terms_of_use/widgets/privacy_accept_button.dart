import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../app/gen/l10n/l10n.dart';
import '../../../../blocs/blocs.dart';
import '../../../app/widgets/widgets.dart';
import '../../../core/typedefs/typedefs.dart';
import '../../../repositories/repositories.dart';

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
                      L10n.current.iAgreeToThe,
                      textAlign: TextAlign.center,
                    ),
                    GradientTextButton(
                      L10n.current.fusionPrivacyNotice,
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
    DevicePrefsModel devicePrefs,
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
