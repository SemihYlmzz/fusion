import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ClosableAnimatedScaffold extends StatelessWidget {
  const ClosableAnimatedScaffold({
    required this.child,
    this.backgroundColor,
    super.key,
  });
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.transparent,
        body: GestureDetector(
          onTap: () {},
          child: Center(
            child: Animate(
              effects: const [
                FadeEffect(),
                ScaleEffect(
                  begin: Offset(0.85, 0.85),
                  end: Offset(1, 1),
                ),
                ShimmerEffect(),
              ],
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
