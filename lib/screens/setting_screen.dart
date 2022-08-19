import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/main_drawer.dart';
import '../widgets/adaptive_switch_list_tile.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settigns';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _lactosefree = false;
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include Gluten-free meals'),
                  value: _glutenfree,
                  onChanged: null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Gluten-free',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black45),
                            ),
                          ),
                          Text(
                            'Only include Gluten-free meals',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black26),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    CupertinoSwitch(
                      onChanged: null,
                      value: _glutenfree,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
