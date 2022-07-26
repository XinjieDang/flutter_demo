// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

//seach是单独的页面
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('搜索页面'),
      ),
      body: Text('搜索页面内容区域'),
    );
  }
}
