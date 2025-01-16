//익명함수
import 'dart:math';

void main() {
  //응용코드 만들어보기 - 익명함수
  var afterToday = (days) {
    var today = DateTime.now();
    return today.add(Duration(days: days));
  };

  var pi = (half) {
    return half * half * 3.14;
  };

  var StrLength = (String str) {
    return str.length;
  };

  var filter = (List<int> nums, int divNum) {
    return nums.where((num) => num ~/ divNum == 0).toList();
  };

  var gcd = (int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  };
  print('오늘로부터 3일 후 ${afterToday(3)}');
  print('원의 넓이 구하기 ${pi(3.555)}');
  print('문자열의 길이 구하기 ${StrLength('hello dart!')}');
  print('리스트 필터링 ${filter([2, 5, 7, 22, 56, 127, 9], 3)}');
  print('두 수의 최대공약수 ${gcd(16, 48)}');
}
