import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [ListViewBasic()]),
    );
  }
}

class ListViewBasic extends StatelessWidget {
  ListViewBasic({Key? key}) : super(key: key);
  final List<Widget> drivers = List.generate(
      9,
      (index) => ListTile(
            dense: false, // 是否使用缩小布局
            contentPadding: EdgeInsets.only(right: 20.0),
            leading: Image.asset(
              "images/car-demo.png",
              width: 126.0,
              height: 83.0,
            ),
            title: Text(
              '桂林市弘达驾校',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '桂林市七星区东二环路与信息路交叉路口往南约150米',
              style: TextStyle(
                  fontSize: 13.0, color: Color.fromARGB(102, 102, 102, 1)),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600.0,
        width: 375.0,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return drivers[index];
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Color.fromARGB(255, 234, 236, 238),
                thickness: 2,
              );
            },
            itemCount: drivers.length));
  }
}
