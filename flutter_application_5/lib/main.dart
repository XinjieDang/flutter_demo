import 'package:flutter/material.dart';
import 'package:flutter_application_5/page/Login.dart';
import 'package:flutter_application_5/page/Tabs.dart';
//main 方法=》首页=》构建ui

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //flutter 框架，设置应用名称，主题样式，语言，定义路由和首页
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent, //点击时的高亮效果设置为透明
        highlightColor: Colors.transparent, //长按时的扩散效果设置为透明
      ),
      //应用首页
      home: Tabs(),
      //注册路由表
      routes: {
        '/login': ((context) => LoginPage()),
        '/home': (context) => Tabs(),
      },
    );
  }
}
