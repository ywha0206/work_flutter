// Animal 추상 클래스를 구현해서 만들어 줘 라고 부탁했어야 했다.
// 팀장이 설계했었어야지
abstract class Animal {
  void performAction();
}

// 추상 클래스를 구현할 때 implements 를 사용
class Dog implements Animal {
  @override
  void performAction() {
    print('멍멍 배고파');
  }
}

class Cat implements Animal {
  @override
  void performAction() {
    print('야옹 배고파');
  }
}

class Fish implements Animal {
  @override
  void performAction() {
    print('뻐끔뻐끔 배고파');
  }
}

// 한 단계 더 나아가 보자~ 실력 쌓기
// 동적 바인딩이란 뭘까?
void start(Animal a) {
  // performAction() 메서드가 동작하게 만들고 싶다.
  // 단, 강아지든 고양이든 물고기든 동적으로 들어오더라도
  // performAction이 호출되게 설계해야 해!
  a.performAction();
}

void start1(Cat c) {
  c.performAction();
}

void start2(Dog c) {
  c.performAction();
}

void start3(Fish c) {
  c.performAction();
}

void main() {
  start(Dog());
  start(Cat());
  start(Fish());
}
