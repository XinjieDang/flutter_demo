// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'category.dart';
import 'home.dart';
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
      //底部tabaar,配置底部tabs 可以有多个按钮
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // ignore: prefer_const_literals_to_create_immutables
        //当前选中的索引
        // ignore: unnecessary_this
        currentIndex: this._currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        //当tabbar 点击时
        onTap: (tappedIndex) {
          // ignore: avoid_print
          setState(() {
            // ignore: unnecessary_this
            this._currentIndex = tappedIndex;
          });
        },
        //选中颜色
        fixedColor: Colors.red,
      ),
    );
  }
}
