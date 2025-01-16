// Null Safety란?
// 개발자가 널 에러를 피할 수 있도록 도와주는 다트 언어의 기능
void main() {
  String name = '길동';
  int age = 30;

  // String? = 스트링옵셔널 타입
  // null을 허용
  String? nullableName;
  int? nullableAge;

  print('name : ${name}');
  // print('nullableName : ${nullableName.length}'); 컴파일 시점에 오류를 미리 확인할 수 있다.
  print('nullableAge : ${nullableAge}');

  // 방어적 코드도 작성해보자.
  if (nullableName != null) {
    print(nullableName.length);
  }
}
