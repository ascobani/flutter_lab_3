import 'package:flutter/material.dart';

class MealItemAffordability extends StatelessWidget {
  final int affordability;
  MealItemAffordability(this.affordability);
  List<Icon> _affordabilityMoneyIcons() {
    List<Icon> money = [];
    for (int i = 0; i < affordability; i++) {
      money.add(Icon(Icons.attach_money));
    }
    return money;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _affordabilityMoneyIcons(),
    );
  }
}
