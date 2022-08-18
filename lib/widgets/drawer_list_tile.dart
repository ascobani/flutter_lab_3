import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  void naivgate;

  DrawerListTile({
    required this.icon,
    required this.title,
    required this.naivgate,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        naivgate;
        HapticFeedback.heavyImpact();
      },
    );
  }
}
