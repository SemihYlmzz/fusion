import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/widgets/bottom_sheets/terms_of_service_bottom_sheet.dart';
import 'package:fusion/core/typedefs/typedefs.dart';
import 'package:fusion/features/terms_of_use/widgets/green_check_box.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../app/l10n/l10n.dart';

class TermsAcceptButton extends StatelessWidget {
  const TermsAcceptButton({
    required this.onAccept,
    required this.isAcceptedTerms,
    super.key,
  });
  final BoolCallback onAccept;
  final bool isAcceptedTerms;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePrefsBloc, DevicePrefsState>(
      builder: (context, devicePrefsState) {
        return Padding(
          padding: SharedPaddings.vertical8,
          child: Row(
            children: [
              GreenCheckBox(
                isAccepted: isAcceptedTerms,
                onAccept: onAccept,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(context.l10n.iAgreeToThe),
                    GradientTextButton(
                      context.l10n.termsOfService,
                      onTap: () async {
                        await showBottomSheett(
                          const TermsOfService(),
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
