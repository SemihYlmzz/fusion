import 'package:fusion/audio/audio.dart';

import '../injection_container.dart';

class AudioCubitInjection {
  static void inject() {
    // UserBloc <-connection-> UseCases
    getIt.registerSingleton<AudioCubit>(
      AudioCubit(),
    );
  }
}
