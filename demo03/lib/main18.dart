class Burger {
  String? name;
  Burger() {
    print('버거 생성자 호출()');
  }
}

class CheeseBurger extends Burger {
  CheeseBurger(String name) {
    print('치즈버거 생성자 호출()');
    //this.name = name;
    super.name = name;
  }
}

void main() {
  CheeseBurger ch1 = CheeseBurger('더블치즈버거');
  // 문제 - 사용시점, 치즈버거 생성자 호출시 인수로 전달받은 문자열을
  // 부모 클래스인 name 변수에 저장하고 싶다면 어떻게 코드를 작성하지?
  print(ch1.name);
}
