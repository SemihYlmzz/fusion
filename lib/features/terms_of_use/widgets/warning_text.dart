import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';

class WarningText extends StatelessWidget {
  const WarningText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: SharedPaddings.all8,
      child: Text(
        'By continuing, I agree to the Terms of Service and acknowledge reading the Privacy Notices for Nuverse and Second Dinner.',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
