import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_constants/shared_constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    required this.isLoading,
    required this.child,
    required this.size,
    super.key,
  });
  final bool isLoading;
  final Widget child;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: isLoading,
          child: Animate(
            effects: const [
              FadeEffect(delay: SharedDurations.ms500),
            ],
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.black87,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
