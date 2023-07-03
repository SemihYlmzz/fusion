import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';

class NotSupWidthScf extends StatelessWidget {
  const NotSupWidthScf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.grey.shade900,
        child: const Center(
          child: Text(
            SharedMessages.deviceSizeTooSmall,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
