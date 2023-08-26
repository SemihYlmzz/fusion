import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.text,
    this.width = 280,
    super.key,
    this.onPressed,
    this.onLongPressed,
    this.isOutlined = false,
    this.textStyle,
    this.gradient,
  });
  final LinearGradient? gradient;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final double? width;
  final String text;
  final TextStyle? textStyle;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    List<Color> mainColorsList = [Colors.orange, Colors.pink];
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => (gradient ??
                    LinearGradient(
                      colors: isOutlined
                          ? mainColorsList
                          : [
                              Colors.white,
                              Colors.white,
                            ],
                    ))
                .createShader(bounds),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: width ?? double.infinity,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isOutlined ? Colors.white : Colors.transparent,
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [
                    0.15,
                    0.75,
                  ],
                  tileMode: TileMode.mirror,
                  colors: isOutlined
                      ? [
                          Colors.transparent,
                          Colors.transparent,
                        ]
                      : gradient?.colors ?? mainColorsList,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  onPressed?.call();
                },
                onLongPress: onLongPressed != null
                    ? () {
                        onLongPressed!.call();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: Text(
                  text,
                  style: (textStyle ?? const TextStyle()).copyWith(
                    color: isOutlined ? Colors.transparent : Colors.white,
                    fontSize: 16,
                  ),
                  //AppTextStyles.titleLarge
                ),
              ),
            ),
          ),
          if (isOutlined)
            IgnorePointer(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            )
        ],
      ),
    );
  }
}
