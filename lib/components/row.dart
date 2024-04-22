import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowHeader extends StatelessWidget {
  IconData icon;
  String text;

  RowHeader({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color(0xFF3836b2),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFFb6b4d7),
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
