// 코드의 진입점
void main() {
  // 오버로딩보다 강력한 선택적 매개변수가 있기 때문에 dart에서는 오버로딩이 없다
  Person(name: '홍길동');
} // end of main

class Person {
  String name;
  int? money;

  Person({required this.name}) {}
}
