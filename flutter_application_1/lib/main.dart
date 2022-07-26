// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'pages/tabs/tabs.dart';
import 'pages/form.dart';
import 'pages/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // final routes = {
  //   '/form': ((context) => FormPage()),
  //   '/search': (context) => SearchPage(),
  // };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Tabs(),
      routes: {
        '/form': ((context) => FormPage()),
        '/search': (context) => SearchPage(),
      },
    );
  }
}
