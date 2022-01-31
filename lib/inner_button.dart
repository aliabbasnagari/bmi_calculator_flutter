import 'package:flutter/material.dart';

class InnerButton extends StatelessWidget {
  const InnerButton({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
