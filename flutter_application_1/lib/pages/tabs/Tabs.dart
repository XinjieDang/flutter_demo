// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'Category.dart';
import 'Home.dart';
import 'setting.dart';

class Tabs extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // ignore: prefer_final_fields
  int _currentIndex = 0;
  // ignore: prefer_final_fields
  List _pageList = [HomePage(), SettingPageState(), CategoryPageState()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      // ignore: unnecessary_this
      body: this._pageList[this._currentIndex],
      //底部tabaar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // ignore: prefer_const_literals_to_create_immutables
        //当前选中的索引
        // ignore: unnecessary_this
        currentIndex: this._currentIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        //当tabbar 点击时
        onTap: (tappedIndex) {
          // ignore: avoid_print
          setState(() {
            // ignore: unnecessary_this
            this._currentIndex = tappedIndex;
          });
        },
      ),
    );
  }
}
