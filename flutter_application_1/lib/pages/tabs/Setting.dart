// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingPageState extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SettingPageState({Key? key}) : super(key: key);

  @override
  State<SettingPageState> createState() => _SettingPageStateState();
}

class _SettingPageStateState extends State<SettingPageState> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        ListTile(
          title: Text('我是一个文本'),
        ),
        ListTile(
          title: Text('我是一个文本'),
        ),
        ListTile(
          title: Text('我是一个文本'),
        ),
      ],
    );
  }
}
