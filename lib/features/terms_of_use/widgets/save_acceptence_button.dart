import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../app/l10n/l10n.dart';
import '../../../../blocs/blocs.dart';

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
          text: context.l10n.acceptText,
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
