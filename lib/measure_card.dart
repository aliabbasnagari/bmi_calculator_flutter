import 'package:flutter/material.dart';
import 'inner_button.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard({
    Key? key,
    required this.title,
    required this.measure,
    required this.unit,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  final String title;
  final int measure;
  final String unit;
  final void Function() increment;
  final void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              measure.toString(),
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              unit,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InnerButton(
              title: '-',
              onPress: decrement,
            ),
            InnerButton(
              title: '+',
              onPress: increment,
            ),
          ],
        ),
      ],
    );
  }
}
