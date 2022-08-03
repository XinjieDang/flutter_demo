import 'dart:developer';

void main(List<String> args) {
  print('debug: 777878');
  //1、var 类型一但声明，不能改变其他类型
  var message = '测试消息';
  //  message = 111;//报错

  //2、dynamic 和object
  //object 是Dart 所有对象的根基类，在dart中所有类型都是Object 的子类(包括function 和null) dynamic 和object 声明的变量都可以赋值任意对象，且后期可以改变赋值的类型。
  dynamic t;
  Object x;
  t = 'hello world';
  x = 'hello object';
  // 下面的代码没有问题,后期可以改变。
  t = 1000;
  x = 2000;
  //dynamic 和object 的不同之处 dynamic 声明的对象编译器会提供所有可能的组合
  //3、final 和const， final 变量只能被声明一次,const 编译时直接替换为常量，final和const 修饰的变量，变量类型可以省略
  const apple = '苹果';
  final person = '勒布朗';

  //4、 空安全 定义变量时可以指定变量是可空还是不可空
  int i = 8; //定义时就赋值，默认不可空
  int? j; //定义为可空类型，在使用前必须判空
  //在定义时不能确定初始值，可以加 late 关键字，表示稍后初始化，在正式使用之前必须保证已经初始化过了
  late int k;
  k = 9;
}

class Test {
  int? i;
  Function? fun;
  say(){
    if(i!null){
      //加上！显示声明不为null
      print(i!*8);
    }
    if(fun!=null){
      fun!();
    }
  }
}


//5、函数 dart 中函数也是对象，并且有一个类型function 意味着函数可以赋值给变量或作为参数传递给其他函数=>函数式编程
//函数声明 如果没有显示的声明返回类型会被当做dynamic 处理，函数返回值没有类型推断
bool isNoble(int atomicNumber){
  return _nobleGases[atomicNumber]!=null;
}

//不指定返回类型，此时默认为dynamic，不是bool
// isNoble(int atomicNumber) {
//   return _nobleGases[atomicNumber] != null;
// }
//对于只包含一个表达式的函数，可以使用简写语法
bool isNoble2(int atomicNumber)=>true;
//函数作为变量
// var say = (str){
//   print(str);
// };
// say("hi world");

//函数作为参数传递
void execute(var callback){
  callback();
}
//此函数 调用 需要一个函数传入
//execute(()=> print('xxx'));
//可选的位置参数 用[]标记为可选的位置参数，并放在参数列表的后面
String sayHello(String from,String msg,[String?device]){
  var result='$from say $msg';
  if(device!=null){
    result='$result with a $device';
  }
  return result;
}
//可选的命名参数,定义函数时 使用{param1,param2,...},放在参数列表的最后面，用于指定命名参数
// void enableFlags({bool bold,bool hidden}){
//   print('可选的命名参数');
// };
// //调用函数时，可以使用指定命名参数，例如 paramName:value
// enableFlags(bold:true,hidden:false);

//6、mixin Dart 是不支持多继承的，支持mixin ,mixin 可以组合多个类
// 例子  定义一个person 类 实现吃饭、说话、走路和写代码功能，同时定义一个dog 实现吃饭和走路功能

class Peson{
  say(){
    print('say');
  }
}
mixin Eat{
  eat(){
    print('eat');
  }
}

mixin Walk {
  walk() {
    print('walk');
  }
}
mixin Code {
  code() {
    print('key');
  }
}
//定义几个 mixin 通过 with 关键字 将它们组合成不同的类

class Dog with Eat, Walk{}
class Man extends Person with Eat, Walk, Code{};

//异步支持  返回Future 或者 Stream 对象的函数，这些函数称为异步函数
//Future 和Promise 非常相似，表示一个异步操作的最终完成或者失败及其结果的表示，一个Future只会对应一个结果，要么成功要么失败
//Future 的所有API的返回值仍然是一个Future对象，所以可以很方便的进行链式调用

// Future.delayed(Duration(seconds: 2),(){
//    return "hi world!";
// }).then((data){
//    print(data);
// }).catchError((e){
   //执行失败会走到这里  
//   print(e);
// });

//无论执行成功或者失败都会执行的  Future.whenComplete
// Future.delayed(Duration(seconds: 2),(){
//    //return "hi world!";
//    throw AssertionError("Error");
// }).then((data){
//    //执行成功会走到这里 
//    print(data);
// }).catchError((e){
//    //执行失败会走到这里   
//    print(e);
// }).whenComplete((){
//    //无论成功或失败都会走到这里
// });

//等待 多个异步任务都执行结束后才执行一些操作 Future.wait

// Future.wait([
//   // 2秒后返回结果  
//   Future.delayed(Duration(seconds: 2), () {
//     return "hello";
//   }),
//   // 4秒后返回结果  
//   Future.delayed(Duration(seconds: 4), () {
//     return " world";
//   })
// ]).then((results){
//   print(results[0]+results[1]);
// }).catchError((e){
//   print(e);
// });
// //async/await 异步任务串行化async/await
// task() async {
//    try{
//     String id = await login("alice","******");
//     String userInfo = await getUserInfo(id);
//     await saveUserInfo(userInfo);
//     //执行接下来的操作   
//    } catch(e){
//     //错误处理   
//     print(e);   
//    }  
// }



//Stream 用于接收异步事件数据，和Future 不同的是，它可以接收多个异步操作的结果（成功或者失败）
// //在执行异步任务时，可以通过多次触发成功或失败事件来传递结果数据或错误异常

// Stream.fromFutures([
//   // 1秒后返回结果
//   Future.delayed(Duration(seconds: 1), () {
//     return "hello 1";
//   }),
//   // 抛出一个异常
//   Future.delayed(Duration(seconds: 2),(){
//     throw AssertionError("Error");
//   }),
//   // 3秒后返回结果
//   Future.delayed(Duration(seconds: 3), () {
//     return "hello 3";
//   })
// ]).listen((data){
//    print(data);
// }, onError: (e){
//    print(e.message);
// },onDone: (){

// });