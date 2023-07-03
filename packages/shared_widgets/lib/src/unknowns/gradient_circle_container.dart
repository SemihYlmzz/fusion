import 'package:flutter/material.dart';

class GradientCircleContainer extends StatefulWidget {
  const GradientCircleContainer({
    super.key,
    this.boxHeight = 177,
    this.boxWidth = 177,
    this.child,
    this.linearGradient = const LinearGradient(
      colors: [
        Colors.black,
        Colors.white,
      ],
    ),
    this.iconData = Icons.add,
    this.iconSize = 140,
  });
  final double boxHeight;
  final double boxWidth;
  final LinearGradient linearGradient;
  final Widget? child;
  final IconData? iconData;
  final double? iconSize;

  @override
  State<GradientCircleContainer> createState() =>
      _GradientCircleContainerState();
}

class _GradientCircleContainerState extends State<GradientCircleContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => widget.linearGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Container(
            height: widget.boxHeight,
            width: widget.boxWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 8),
            ),
            child: widget.child == null
                ? Icon(
                    widget.iconData,
                    size: widget.iconSize,
                    color: Colors.white,
                  )
                : const SizedBox(),
          ),
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }
}
