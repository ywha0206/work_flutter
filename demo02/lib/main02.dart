// code의 시작점
void main() {
  // 타입 확인 - runtimeType 의 활용
  // 디버깅 및 오류 방지
  // 예상치 못한 타입의 값이 들어올 경우, 프로그램이 제대로 동작하지 않을 수 있다.
  // runtimeType 을 활용해 타입 체크 가능

  int n1 = 10;
  double d1 = 10.1;
  bool b1 = true;
  String s1 = '홍길동'; //홑따옴표 권장사항

  print('정수 : ${n1.runtimeType}');
  print('정수 : ${d1.runtimeType}');
  print('정수 : ${b1.runtimeType}');
  print('정수 : ${s1.runtimeType}');
}
