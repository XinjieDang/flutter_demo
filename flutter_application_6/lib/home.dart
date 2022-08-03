import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const MainPage());
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ignore: prefer_const_constructors
      children: <Widget>[
        const ImagContext(),
        const FavoriteWidget(),
        buttonSection,
        textSection
      ],
    );
  }
}

// 顶部图片
class ImagContext extends StatelessWidget {
  const ImagContext({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://images.pexels.com/photos/4603235/pexels-photo-4603235.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      height: 240.0,
      fit: BoxFit.fill,
    );
  }
}

// 标题行
Widget titleSection = Container(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text('Kandersteg,Switzerland',
                style: TextStyle(color: Colors.grey[500]))
          ],
        )),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text('41'),
      ],
    ));

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteWidget> createState() =>
      _FavoriteWidgetState(); //以下划线(_)开头的成员或类是私有的
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  //点击图标按钮时改变state
  void _toggleFavorite() {
    setState(() {
      // ignore: avoid_print
      print('dd');
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Kandersteg,Switzerland',
                    style: TextStyle(color: Colors.grey[500]))
              ],
            )),
            IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: (_isFavorited
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            ),
            SizedBox(
              width: 18,
              child: SizedBox(child: Text('$_favoriteCount')),
            )
          ],
        ));
  }
}

//一个按钮的私有辅助函数，传入颜色、图标、文本
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min, //排列紧凑
    mainAxisAlignment: MainAxisAlignment.center, //主轴排列方式居中
    children: [
      Icon(
        icon,
        color: color,
      ),
      //这个容器使得文本和图标分开
      Container(
        //参数传递 按钮的图标颜色、图标、文本
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

// 中间按钮菜单布局
Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //主轴剩余空间均分到各列的前后及中间
  children: [
    //传入每一个按钮
    _buildButtonColumn(Colors.blueGrey, Icons.call, 'CALL'),
    _buildButtonColumn(Colors.blueGrey, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(Colors.blueGrey, Icons.share, 'SHARE'),
  ],
);

//底部文本区域

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: const Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true, //填充满列宽后在单词边界处自动换行
  ),
);
