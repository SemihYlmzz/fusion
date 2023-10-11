import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../../app/gen/l10n/l10n.dart';
import '../../../../blocs/blocs.dart';

class SaveAcceptenceButton extends StatelessWidget {
  const SaveAcceptenceButton({
    required this.isReadyToAccept,
    super.key,
  });
  final bool isReadyToAccept;
  @override
  Widget build(BuildContext context) {
    final devicePrefs = context.select(
      (DevicePrefsBloc devicePrefsState) => devicePrefsState.state.devicePrefs,
    );
    return GradientButton(
      width: 200,
      text: L10n.current.acceptText,
      onPressed: !isReadyToAccept
          ? null
          : () {
              context.read<DevicePrefsBloc>().add(
                    UpdateDevicePrefs(
                      devicePrefs: devicePrefs.copyWith(
                        isTermsAndConditionsAccepted: true,
                      ),
                    ),
                  );
            },
    );
  }
}
