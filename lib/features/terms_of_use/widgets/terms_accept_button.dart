import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/l10n/app_localizations.dart';
import 'package:fusion/repositories/device_prefs_repository/bloc/device_prefs_bloc.dart';
import 'package:fusion/repositories/device_prefs_repository/domain/entities/device_prefs.dart';
import 'package:fusion/shared/widgets/bottom_sheets/terms_of_service_bottom_sheet.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

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
              Transform.scale(
                scale: 2,
                child: Checkbox(
                  value: isAcceptedTerms,
                  shape: const CircleBorder(),
                  onChanged: (val) {
                    onAccept(value: val ?? false);
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context).iAgreeToThe),
                    GradientTextButton(
                      AppLocalizations.of(context).termsOfService,
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
