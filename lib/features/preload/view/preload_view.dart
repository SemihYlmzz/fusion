import 'package:flutter/material.dart';
import 'package:shared_constants/shared_constants.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../../gen/assets.gen.dart';

class PreloadView extends StatefulWidget {
  const PreloadView({
    required this.value,
    super.key,
  });
  final double value;

  @override
  State<PreloadView> createState() => _PreloadViewState();
}

class _PreloadViewState extends State<PreloadView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.splash.fusionSplashImage.path),
            fit: BoxFit.none,
          ),
        ),
        child: BaseColumn(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: SharedPaddings.bottom64,
              child: SizedBox(
                width: 320,
                child: LinearProgressIndicator(
                  value: widget.value,
                  minHeight: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
