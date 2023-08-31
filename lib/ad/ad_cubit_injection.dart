import 'package:fusion/ad/ad.dart';

import '../injection_container.dart';

class AdBlocInjection {
  static void inject() {
    getIt.registerSingleton<AdCubit>(
      AdCubit(),
    );
  }
}
