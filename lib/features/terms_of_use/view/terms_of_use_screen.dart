import 'package:flutter/material.dart';

import 'view.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});
  static const String path = '/terms_of_use';
  static const String name = 'terms_of_use';

  @override
  Widget build(BuildContext context) {
    return const TermsOfUseView();
  }
}
