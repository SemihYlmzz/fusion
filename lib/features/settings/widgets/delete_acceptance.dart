import 'package:flutter/material.dart';
import 'package:fusion/core/typedefs/typedefs.dart';
import 'package:fusion/features/terms_of_use/widgets/green_check_box.dart';
import 'package:shared_constants/shared_constants.dart';

class DeleteAcceptance extends StatelessWidget {
  const DeleteAcceptance({
    required this.isAccepted,
    required this.onAccept,
    super.key,
  });
  final bool isAccepted;
  final BoolCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.bottom16,
      child: Row(
        children: [
          GreenCheckBox(
            isAccepted: isAccepted,
            onAccept: onAccept,
          ),
          const Expanded(
            child: Text(
              'Are you sure you want to delete the account?',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
