import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './drawer_list_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              'dfsdfs',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DrawerListTile(
            icon: Icons.restaurant,
            title: 'Meals',
            naivgate: 'naivgate',
          ),
          DrawerListTile(
            icon: Icons.settings,
            title: 'Settings',
            naivgate: 'naivgate',
          ),
        ],
      ),
    );
  }
}
