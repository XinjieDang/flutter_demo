import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton.icon(
          icon: Icon(Icons.send),
          label: Text("搜索页"),
          onPressed: () {
            //普通路由
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => SearchPage()));
            //命名路由,和传递参数
            Navigator.pushNamed(context, '/search', arguments: "hello world");
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          child: const Text("表单并传值"),
          onPressed: () {
            //普通路由
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => FormPage(
            //           title: '跳转传值',
            //         )));
            //命名路由
            Navigator.pushNamed(context, '/form');
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          child: const Text("get请求数据"),
          onPressed: () {
            getHttp();
          },
        )
      ],
    );
  }
}

void getHttp() async {
  try {
    var response = await Dio().get('https://v1.hitokoto.cn/');
    print(response);
  } catch (e) {
    print(e);
  }
}
