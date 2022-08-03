import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('用户登录'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  right: 92.0, left: 91.0, top: 100.0, bottom: 14.0),
              width: 192.0,
              height: 30.0,
              alignment: Alignment.center,
              child: Text(
                "欢迎报名弘达驾校",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Text(
              "好司机，弘达造",
              style: TextStyle(
                  fontSize: 16.0, color: Color.fromRGBO(153, 153, 153, 1)),
            ),
            SizedBox(height: 56.0),
            Image.asset(
              "images/logo-icon.png",
              width: 120.0,
              height: 100.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 167.0),
            Container(
              width: 270.0,
              height: 48.0,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.wechat,
                    size: 27.0,
                  ),
                  label: Text(
                    '微信登录',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0),
                  )),
            )
          ],
        ));
  }
}
