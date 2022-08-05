import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/School_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 列表数组模型初始化
  List<SchoolItem> _choolList = SchoolList([]).list;
  @override
  void initState() {
    super.initState();
    getschoolDate();
  }

  //请求驾校数据
  Future<void> getschoolDate() async {
    Dio dio = Dio();
    Response response = await dio.get("http://10.0.2.2:8080/miniapp/login",
        queryParameters: {"loginCode": 111111});
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 2.0),
        itemCount: 8,
        itemExtent: 132.5,
        itemBuilder: ((context, index) {
          return DriverBox();
        }));
  }
}

Widget DriverBox() {
  return Container(
    width: 375.0,
    height: 132.5,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
              width: 1.0,
              color: Color(
                0xFFFF7F7F7F,
              )),
          bottom:
              BorderSide(width: 1.0, color: Color.fromARGB(255, 229, 226, 226)),
        )),
    child: InfoList(),
  );
}

Widget InfoList() {
  return Row(
    children: [
      SizedBox(width: 16.0),
      Image.asset("images/car-demo.png"),
      SizedBox(width: 12.0),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '桂林市弘达驾校',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.0),
            width: 230.0,
            child: Text(
              '桂林市七星区东二环路与信息路交叉路口往南约150米',
              style: TextStyle(
                  fontSize: 15.0,
                  height: 1.5,
                  color: Color.fromRGBO(102, 102, 102, 1)),
            ),
          ),
          Row(
            children: [
              CategoryBox(),
              CategoryBox(),
            ],
          )
        ],
      )
    ],
  );
}

//分类标签
Widget CategoryBox() {
  return Container(
    margin: EdgeInsets.only(right: 18.0, top: 5.0),
    alignment: Alignment.center,
    width: 50.0,
    height: 19.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Color.fromRGBO(255, 179, 0, 1)),
    child: Text(
      '模范驾校',
      style: TextStyle(fontSize: 10.0, color: Colors.white),
    ),
  );
}
