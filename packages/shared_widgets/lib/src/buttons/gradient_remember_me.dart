import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_constants/shared_constants.dart';

class GradientRememberMe extends StatefulWidget {
  final bool rememberMe;
  final String checkBoxText;
  final TextStyle? textStyle;
  final Function(bool?)? onTap;
  final LinearGradient? gradient;
  const GradientRememberMe({
    super.key,
    required this.rememberMe,
    required this.checkBoxText,
    this.textStyle,
    this.gradient,
    this.onTap,
  });

  @override
  State<GradientRememberMe> createState() => _GradientRememberMeState();
}

class _GradientRememberMeState extends State<GradientRememberMe> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SharedPaddings.horizontal16,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                rememberMe = !rememberMe;
              });
              widget.onTap?.call(rememberMe);
            },
            child: AnimatedContainer(
              width: 36,
              height: 36,
              duration: SharedDurations.ms200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: rememberMe
                      ? widget.gradient?.colors ??
                          [
                            Colors.orange,
                            Colors.pink,
                          ]
                      : [
                          Colors.black,
                          Colors.black,
                        ],
                ),
              ),
              child: Visibility(
                visible: rememberMe,
                child: Animate(
                  effects: const [
                    FlipEffect(duration: Duration(milliseconds: 370)),
                    FadeEffect(),
                    ShakeEffect(duration: Duration(milliseconds: 500))
                  ],
                  child: const Icon(
                    Icons.done,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                rememberMe = !rememberMe;
              });
              widget.onTap?.call(rememberMe);
            },
            child: Text(
              widget.checkBoxText,
              style: widget.textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
