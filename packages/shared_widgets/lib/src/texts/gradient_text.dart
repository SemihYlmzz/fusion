import 'package:flutter/material.dart';

class GradientTextButton extends StatelessWidget {
  const GradientTextButton(
    this.text, {
    this.gradient,
    super.key,
    this.style,
    this.align,
    this.maxLines = 1,
    this.textShadow = false,
    this.onTap,
  });
  final Function()? onTap;
  final int maxLines;
  final String text;
  final TextStyle? style;
  final Gradient? gradient;
  final TextAlign? align;
  final bool textShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => (gradient ??
                const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [
                    0.15,
                    0.75,
                  ],
                  colors: [
                    Colors.orange,
                    Colors.pink,
                  ],
                ))
            .createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Text(
          " $text ",
          style: style != null
              ? style!.copyWith(
                  shadows: [
                    Shadow(
                      color: textShadow == false
                          ? Colors.transparent
                          : Colors.purple,
                      blurRadius: 12,
                    ),
                  ],
                )
              : null,
          textAlign: align,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
