import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/widgets/bottom_sheets/terms_of_service_bottom_sheet.dart';
import 'package:fusion/core/typedefs/typedefs.dart';
import 'package:fusion/features/terms_of_use/widgets/green_check_box.dart';
import 'package:fusion/repositories/repositories.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../app/gen/l10n/l10n.dart';
import '../../../../blocs/blocs.dart';

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
                    Text(L10n.current.iAgreeToThe),
                    GradientTextButton(
                      L10n.current.termsOfService,
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
