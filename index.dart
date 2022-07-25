// 变量
void main(List<String> args) {
  // 声明变量 不指定类型 使用var 关键字,在函数内本地变量使用var
  var name = "张三";
  // 明确类型 使用 String,有类型推导，两种实现效果一样
  String firstName = "李四";
  print("hello world" + firstName);
  // 在类型不明确的情况下，可以使用dynamic关键
  dynamic name2 = "王五";

  // 默认值，未初始化的变量默认是是null ,数字类型默认值也是nul
  int lineCount = 5;
  assert(lineCount == null);

  // 使用过程中从来不会被修改的变量 可以使用final 或const

  // final lastName='peter';
  final String name3 = "peter";
  //name3 = "bob"; final 不能被修改

  //需要在编译时就确定的变可以使用const,如果是类级别的需要标记为static
  const bar = 10000000;
  const double atm = 1.023124 * bar;

  //const 关键字不仅可以用于声明常量变量，还可以用来创建常量值
  var foo = const [];
  final bar = const [];
  const baz = [];
  // const 变量的值不能被赋值修改
  baz = [42];
}
