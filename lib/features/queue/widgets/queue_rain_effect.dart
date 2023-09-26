import 'package:flutter/material.dart';
import 'package:newton_particles/newton_particles.dart';

class QueueRainEffect extends StatelessWidget {
  const QueueRainEffect({super.key});
  static const List<Color> _colorList = [
    Colors.white,
    Colors.white60,
    Colors.transparent,
  ];

  @override
  Widget build(BuildContext context) {
    return Newton(
      activeEffects: [
        RainEffect(
          particleConfiguration: ParticleConfiguration(
            color: const LinearInterpolationParticleColor(
              colors: _colorList,
            ),
            shape: CircleShape(),
            size: const Size(5, 5),
          ),
          effectConfiguration: const EffectConfiguration(),
        ),
      ],
    );
  }
}
