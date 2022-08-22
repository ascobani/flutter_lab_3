import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settigns';

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  SettingsScreen(this.saveFilters, this.currentFilters);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenfree = widget.currentFilters['gluten']!;
    _lactosefree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final sellectedFilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilters(sellectedFilters);
              },
              icon: Icon(Icons.save))
        ],
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
          // 1
          Container(
            height: 55,
            child: Expanded(
              child: ListView(
                children: <Widget>[
                  Platform.isAndroid
                      ? SwitchListTile(
                          title: Text(
                            'Gluten-free',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Only include Gluten-free meals',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black38,
                            ),
                          ),
                          value: _glutenfree,
                          onChanged: (newValue) {
                            setState(() {
                              _glutenfree = newValue;
                            });
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          child: Row(
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
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Only include Gluten-free meals',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              CupertinoSwitch(
                                onChanged: (newValue) {
                                  setState(() {
                                    _glutenfree = newValue;
                                  });
                                },
                                value: _glutenfree,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          // 2
          Container(
            height: 55,
            child: Expanded(
              child: ListView(
                children: <Widget>[
                  Platform.isAndroid
                      ? SwitchListTile(
                          title: Text('Lactose-free'),
                          subtitle: Text(
                            'Only include Lactose-free meals',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black38,
                            ),
                          ),
                          value: _lactosefree,
                          onChanged: (newValue) {
                            setState(() {
                              _lactosefree = newValue;
                            });
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                width: 240,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Lactose-free',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Only include Lactose-free meals',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.black38),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CupertinoSwitch(
                                onChanged: (newValue) {
                                  setState(() {
                                    _lactosefree = newValue;
                                  });
                                },
                                value: _lactosefree,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          // 3
          Container(
            height: 55,
            child: Expanded(
              child: ListView(
                children: <Widget>[
                  Platform.isAndroid
                      ? SwitchListTile(
                          title: Text('Vegetarian'),
                          subtitle: Text(
                            'Only include Vegetarian meals',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black38,
                            ),
                          ),
                          value: _vegetarian,
                          onChanged: (newValue) {
                            setState(() {
                              _vegetarian = newValue;
                            });
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                width: 221,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Vegetarian',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Only include Vegetarian meals',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.black38),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 37,
                              ),
                              CupertinoSwitch(
                                onChanged: (newValue) {
                                  setState(() {
                                    _vegetarian = newValue;
                                  });
                                },
                                value: _vegetarian,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          // 4

          Container(
            height: 55,
            child: Expanded(
              child: ListView(
                children: <Widget>[
                  Platform.isAndroid
                      ? SwitchListTile(
                          title: Text('Vegan'),
                          subtitle: Text(
                            'Only include Vegan meals',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black38,
                            ),
                          ),
                          value: _vegan,
                          onChanged: (newValue) {
                            setState(() {
                              _vegan = newValue;
                            });
                          },
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: 200,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Vegan',
                                      style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Only include Vegan meals',
                                      style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.black38),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            CupertinoSwitch(
                              onChanged: (newValue) {
                                setState(() {
                                  _vegan = newValue;
                                });
                              },
                              value: _vegan,
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Theme',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
