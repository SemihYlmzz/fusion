import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../blocs/blocs.dart';

class QueueControlButton extends StatelessWidget {
  const QueueControlButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isHapticsOn = context.select((DevicePrefsBloc devicePrefsBloc) {
      return devicePrefsBloc.state.devicePrefs.isHapticsOn;
    });
    return GradientButton(
      isOutlined: true,
      text: 'Retry',
      onPressed: () {
        if (isHapticsOn) {
          HapticFeedback.heavyImpact();
        }
        context.read<QueueBloc>().add(const ClearQueueErrorMessageRequested());
      },
    );
  }
}
