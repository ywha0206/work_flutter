// 코드의 진입점
void main() {
  // 생성자
  Dog(name: '공주', age: 15);
} // end of main

// 선택적 매개변수
// 선택적 위치 매개변수 (Optional Positional Paramters)
// 선택적 명명 매개변수 (Optional Named Paramters)

// Dart라는 언어는 기본적으로 null 허용하지 않는다
class Dog {
  String name;
  int age;
  String? color; // String Optional 타입 null 허용
  int? thirsty; // 마찬가지로 int Optional 타입이 됨

  // {} 붙이면 선택적 명명 매개변수가 됨
  Dog(
      {required this.name,
      required this.age,
      this.color = '블랙',
      this.thirsty = 100});
}

class Water {
  double liter = 2.0; //물 2리터

  void drink() {
    // liter = liter - 0.1;
    liter -= 0.1;
  }
}
