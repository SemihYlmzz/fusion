import 'package:flutter/material.dart';
import 'package:shared_widgets/shared_widgets.dart';

class Conditions extends StatelessWidget {
  const Conditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 2,
      spacing: 4,
      children: [
        const Text('I agree to the'),
        GradientTextButton(
          'Terms of Service',
          onTap: () {},
        ),
        const Text('Have read'),
        const Text('the Privacy Notices for'),
        GradientTextButton(
          'Nuverse',
          onTap: () {},
        ),
        const Text('and'),
        GradientTextButton(
          'Second Dinner',
          onTap: () {},
        ),
        const Text(
          'and confirm that i am at',
        ),
        const Text(
          'least 13 years old.',
        ),
      ],
    );
  }
}
