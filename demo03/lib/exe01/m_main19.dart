class Animal {
  final String name;
//  Animal(this.name) {
//    print('애니멀 생성자 호출');
//  }
//   Animal(String name) : this.name = name ;
  Animal(this.name);
}

class Dog extends Animal {
  Dog(String name) : super(name) {
    print('Dog 생성자 호출');
  }

  void bark() {
    print('${name}가 말했어요. "멍멍!"');
  }
}

void main() {
  Animal d1 = Dog('공주');
  (d1 as Dog).bark();
}
