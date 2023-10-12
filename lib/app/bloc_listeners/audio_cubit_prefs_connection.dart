import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../cubits/cubits.dart';

BlocListener<DevicePrefsBloc, DevicePrefsState> audioCubitPrefsConnection(
  AudioCubit audioCubit,
) {
  return BlocListener<DevicePrefsBloc, DevicePrefsState>(
    listener: (context, devicePrefsState) {
      if (devicePrefsState is! DevicePrefsReaded) {
        return;
      }
      if (audioCubit.state.isDevicePrefsConnected) {
        return;
      }
      context.read<AudioCubit>().connectDevicePrefs(
            devicePrefsState.devicePrefs.backGroundSoundVolume,
            devicePrefsState.devicePrefs.dialogsSoundVolume,
            devicePrefsState.devicePrefs.generalSoundVolume,
            devicePrefsState.devicePrefs.soundEffectsSoundVolume,
          );
    },
  );
}
