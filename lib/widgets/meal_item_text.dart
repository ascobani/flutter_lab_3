import 'package:flutter/material.dart';

class MealItemText extends StatelessWidget {
  final icon;
  var handler;
  final String text;

  MealItemText({
    required this.icon,
    required this.handler,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 6),
        Text('${handler}' + text),
      ],
    );
  }
}
