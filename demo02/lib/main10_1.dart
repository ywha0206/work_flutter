// 코드의 진입점
void main() {
  Dog d1 = Dog();
  Water wt = Water();

  print('강아지 현재 갈증지수 : ${d1.thirsty}');
  print('현재 물의 양 : ${wt.liter}');

  d1.drinkWater(wt);
  print('강아지 현재 갈증지수 : ${d1.thirsty}');
  print('현재 남은 물의 양 : ${wt.liter}');
} // end of main

class Dog {
  String name = '토토';
  int age = 5;
  String color = 'black';
  int thirsty = 100;

  // 물을 마실 때마다 갈증지수가 10씩 내려가는 메서드
  void drinkWater(Water wt) {
    thirsty = thirsty - 10;
    wt.drink();
  }
}

class Water {
  double liter = 2.0; //물 2리터

  void drink() {
    // liter = liter - 0.1;
    liter -= 0.1;
  }
}
