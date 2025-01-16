// 코드의 진입점
void main() {
  Dog d1 = Dog();

  d1.name;
  print('강아지 이름 : ${d1.name}');
  print('강아지 나이 : ${d1.age}');
  print('강아지 색상 : ${d1.color}');
  print('강아지 현재 갈증지수 : ${d1.thirsty}');

  // d1.thirsty = 50;
  d1.drinkWater(5);
  print('강아지 현재 갈증지수 : ${d1.thirsty}');
} // end of main

class Dog {
  // 변수에 선언과 동시에 초기화(값을 넣다)
  String name = '토토';
  int age = 5;
  String color = 'black';
  int thirsty = 100;

  // 물을 마실 때마다 갈증지수가 10씩 내려가는 메서드
  void drinkWater(int count) {
    thirsty = thirsty - 10 * count;
  }
}

class Water {
  double liter = 2.0; //물 2리터

  void drink() {
    // liter = liter - 0.1;
    liter -= 0.1;
  }
}
