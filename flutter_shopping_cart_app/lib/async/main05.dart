void main() async {
  await addNumber1(10, 20);
  print('메인 함수 완료');
}

// 1 단계
// Future 타입을 동기적 방식으로 소화하자.
Future<void> addNumber1(int n1, int n2) async {
  print('addNumber1 함수 시작');
  // 함수 내부의 결과값은 지역 변수를 무조건 만드는 것이 권장...
  var result = 0;
  await Future.delayed(Duration(seconds: 3), () {
    result = n1 + n2;
  });
  print('addNumber1 연산 완료 : ${result}');
  // return result;
}
