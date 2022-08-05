import 'package:flutter_application_5/models/SchoolParamMap_model.dart';

//驾校列表模型

class SchoolList {
  List<SchoolItem> list;
  SchoolList(this.list);
  factory SchoolList.fromJson(List<dynamic> list) {
    // 调用自身构造方法传值并返回
    return SchoolList(
      list.map((listItem) => SchoolItem.fromJson(listItem)).toList(),
    );
  }
}

//驾校项模型
class SchoolItem {
  final int id;
  final String title;
  final String imgurl;
  final SchoolParamMapItem schoolParamMapItem;

  SchoolItem(
      {required this.id,
      required this.title,
      required this.imgurl,
      required this.schoolParamMapItem});

  factory SchoolItem.fromJson(dynamic listItem) {
    // 调用自身构造方法传值并返回
    return SchoolItem(
      id: listItem['id'],
      title: listItem['title'],
      imgurl: listItem['imgurl'],
      schoolParamMapItem: listItem['schoolParamMapItem'],
    );
  }
}
