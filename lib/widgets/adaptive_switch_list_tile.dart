import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveSwitchListTile extends StatelessWidget {
  final String subtitle;
  final String title;
  final bool value;

  AdaptiveSwitchListTile({
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              SwitchListTile(
                title: Text(title),
                subtitle: Text(subtitle),
                value: value,
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
                            title,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black45),
                          ),
                        ),
                        Text(
                          subtitle,
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
                    value: value,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
