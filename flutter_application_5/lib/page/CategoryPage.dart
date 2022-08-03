import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.0,
        height: 100.0,
        child: ElevatedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: () => {Navigator.pushNamed(context, '/login')},
        ));
  }
}
