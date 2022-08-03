import 'package:flutter/material.dart';
import 'CategoryPage.dart';
import 'HomePage.dart';
import 'SchoolPage.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);
  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [HomePage(), CategoryPage(), SchoolPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('驾校报名'),
      ),
      //body需要的是一个widget,如果直接写 Containner 或者 Text这种组件是不显示的
      body: _pageList[_currentIndex],
      //配置底部tabbar
      bottomNavigationBar: BottomNavigationBar(
        //可以有多个按钮
        type: BottomNavigationBarType.fixed,
        //当前选中的索引
        currentIndex: this._currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.drive_eta), label: '驾校报名'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '模拟驾考'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
        ],
        //当Tabbar点击时
        onTap: (value) {
          setState(() {
            this._currentIndex = value;
          });
        },
        //选中时的颜色
        fixedColor: Colors.blue,
      ),
    );
  }
}
