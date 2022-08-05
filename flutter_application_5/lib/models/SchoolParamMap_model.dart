class SchoolParamMapItem {
  final String summary;
  final String addr;
  final String tags;
  SchoolParamMapItem(
      {required this.summary, required this.addr, required this.tags});

  factory SchoolParamMapItem.fromJson(dynamic listItem) {
    // 调用自身构造方法传值并返回
    return SchoolParamMapItem(
      summary: listItem['summary'],
      addr: listItem['addr'],
      tags: listItem['tags'],
    );
  }
}
