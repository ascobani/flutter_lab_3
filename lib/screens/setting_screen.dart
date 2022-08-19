import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settigns';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
