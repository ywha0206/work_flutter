// 일단 그냥 할 뿐 ~
import 'package:flutter/scheduler.dart';

void main() {
  var n1 = 1;
  var d1 = 10.1;
  var b1 = true;
  var s1 = '홍길동';

  print(n1.runtimeType);
  print('실수 : ${d1.runtimeType}');
  print('bool : ${b1.runtimeType}');
  print('String : ${s1.runtimeType}');

  print('----------------------------');

  dynamic dy1 = 1400;
  dy1 = true;

  print('dynamic : ${dy1.runtimeType}');
}
