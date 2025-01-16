// 팀장이 물고기 소리 나는 프로그램을 만들어 달라 요청을 했다면?
class Dog {
  void performAction() {
    print('멍멍 배고파');
  }
}

class Cat {
  void performAction() {
    print('야옹 배고파');
  }
}

//신입이 작성했다고 가정
class Fish {
  void hungry() {
    print('뻐끔뻐끔 배고파');
  }
}

void main() {
  Dog d = Dog();
  Cat c = Cat();
  Fish f = Fish();
  f.hungry();
  // f.performAction(); 동적인 코드로 돌렸다면 오류 발생
  // 팀장의 잘못입니다
}
