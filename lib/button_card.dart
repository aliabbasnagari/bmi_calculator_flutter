import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    required this.cardChild,
    required this.onPress,
  }) : super(key: key);

  final Widget cardChild;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.circular(35),
          ),
          child: cardChild,
        ),
      ),
    );
  }
}
