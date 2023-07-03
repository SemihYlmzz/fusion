import 'package:flutter/material.dart';

class SmallGradientButton extends StatelessWidget {
  const SmallGradientButton({super.key, this.gradient, this.onTap});
  final LinearGradient? gradient;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.adaptive.arrow_back,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
