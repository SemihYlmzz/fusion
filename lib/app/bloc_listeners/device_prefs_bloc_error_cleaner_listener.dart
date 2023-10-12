import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusion/app/app.dart';
import 'package:fusion/core/enums/error_clean_type.dart';
import 'package:fusion/core/enums/error_display_type.dart';

import '../../../blocs/blocs.dart';

BlocListener<DevicePrefsBloc, DevicePrefsState> buildDevicePrefsBlocListener() {
  return BlocListener<DevicePrefsBloc, DevicePrefsState>(
    listener: (context, devicePrefsState) {
      if (devicePrefsState is! DevicePrefsHasError) {
        return;
      }
      if (devicePrefsState.errorDisplayType == ErrorDisplayType.snackBar) {
        showSnackBar(
          context,
          devicePrefsState.errorMessage!,
        );
      }
      if (devicePrefsState.errorCleanType == ErrorCleanType.immediately) {
        context
            .read<DevicePrefsBloc>()
            .add(const ClearDevicePrefsErrorMessage());
      }
    },
  );
}
