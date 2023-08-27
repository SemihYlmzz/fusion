import 'package:flutter/material.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

class PrivacyAcceptButton extends StatelessWidget {
  const PrivacyAcceptButton({
    required this.onAccept,
    required this.isAcceptedPrivacy,
    super.key,
  });
  final BoolCallback onAccept;
  final bool isAcceptedPrivacy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.vertical8,
      child: Row(
        children: [
          Transform.scale(
            scale: 2,
            child: Checkbox(
              value: isAcceptedPrivacy,
              shape: const CircleBorder(),
              onChanged: (val) {
                onAccept(value: val ?? false);
              },
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                Text(
                  'I have read and agree to the',
                  textAlign: TextAlign.center,
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    GradientTextButton(
                      'Nuverse Privacy',
                      maxLines: 2,
                      align: TextAlign.center,
                    ),
                    Text(
                      'and',
                    ),
                    GradientTextButton(
                      'Second Dinner Privacy Notice',
                      maxLines: 2,
                      align: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
