import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_constants/shared_constants.dart';

class NoNetworkScreen extends StatefulWidget {
  const NoNetworkScreen({
    required this.isLoading,
    required this.child,
    required this.size,
    super.key,
  });
  final bool isLoading;
  final Widget child;
  final Size size;

  @override
  State<NoNetworkScreen> createState() => _NoNetworkScreenState();
}

class _NoNetworkScreenState extends State<NoNetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Visibility(
          visible: widget.isLoading,
          child: Animate(
            effects: const [
              FadeEffect(delay: SharedDurations.ms500),
            ],
            child: Container(
              width: widget.size.width,
              height: widget.size.height,
              color: Colors.black87,
              child: Center(
                child: Image.asset(
                  "packages/shared_widgets/assets/images/no_wifi.png",
                  width: 180,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
