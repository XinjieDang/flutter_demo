/**
 * 内建类型 dart 支持 一下内建类型
 *  Number
 *  String
 *  Boolean
 *  List(Array)
 *  Map 
 *  Set
 *  Rune(在字符串中表示Unicode字符)
 *  Symbol
 * 
 * 
 */
void main(List<String> args) {
  var x = 1;
  var hex = 0xdeadbeef;
  //如果一个数字包含小数点，那么就是小数类型
  var y = 1.1;
  var exponents = 1.4e5;
  //dart 2.1 int 字面量会自动转为double
  double z = 1; //1.0

  //字符串转为数字
  var one = int.parse('1');
  assert(one == 1);
  //Sting => double
  var onePointOne = double.parse('1.1');
  //int => String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  //dart 字符串 是一组UTF-16单元序列，字符串通过单引号或者双引号创建
  var str1 = "Single quotes work well for string literals.";
  var str2 = "Double quotes work just as well.";
  //可以通过${expression}的方式内嵌表达式
  var str3 = "abacxd";
  print('这几个' + '${str3}');

  //使用+把多个字符串连接为一个
  var ss2 = 'The + operator ' + 'works, as well.';
  print(ss2);
  //连续使用3个单引号或者三个双引号实现多行字符串对象的创建
  var ss3 = '''you can create muti''';
  var ss5 = """this also a mu""";
}
