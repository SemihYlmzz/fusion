import 'dart:async';

import 'package:fusion/bootstrap.dart';
import 'package:fusion/features/app/view/app.dart';

void main() async {
  unawaited(
    bootstrap((firestore, firebaseAuth) {
      return const App();
    }),
  );
}
