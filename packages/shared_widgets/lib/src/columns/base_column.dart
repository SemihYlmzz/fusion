import 'package:flutter/material.dart';

class BaseColumn extends StatelessWidget {
  const BaseColumn({
    super.key,
    this.children,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.physics,
  });
  final List<Widget>? children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final ScrollPhysics? physics;
  final VerticalDirection verticalDirection;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: physics,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: mainAxisSize,
            textBaseline: textBaseline,
            textDirection: textDirection,
            verticalDirection: verticalDirection,
            key: key,
            children: [...children ?? []],
          ),
        ),
      ],
    );
  }
}
