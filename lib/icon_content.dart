import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.gender,
    required this.icon,
    required this.active,
  }) : super(key: key);

  final IconData icon;
  final String gender;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: active ? Colors.white : Colors.grey,
        ),
        Text(
          gender,
          style: TextStyle(
            color: active ? Colors.white : Colors.grey,
          ),
        ),
      ],
    );
  }
}
