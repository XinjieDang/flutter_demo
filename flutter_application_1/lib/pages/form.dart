import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  String title = '表单';

  FormPage({Key? key, this.title = '表单'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          //返回上一级
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('表单页面'),
          ),
          ListTile(
            title: Text('表单页面'),
          ),
          ListTile(
            title: Text('表单页面'),
          ),
        ],
      ),
    );
  }
}
