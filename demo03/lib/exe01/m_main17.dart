class Hero {
  String? name;
  int? power;
  int? hp;

  Hero(String? name, int? hp, int? power) {
    this.name = name;
    this.power = power;
    this.hp = hp;
  }
}

class Wizard extends Hero {
  Wizard(super.name, super.hp, super.power);

  void iceAttack() {
    print('${name} : 얼음 마법 공격!');
  }
}

class Warrior extends Hero {
  Warrior(String? name, int? hp, int? power) : super(name, hp, power) {
    super.name = name;
    super.hp = hp;
    super.power = power;
  }

  void TwoComboAttack(Wizard w) {
    print('${name} : 3단 콤보를 날릴 수 있지만 이 정도로 봐주겠다 2단 콤보 공격');
    w.iceAttack();
  }
}

void main() {
  Wizard w1 = Wizard('법사1', 150, 10);
  Warrior w2 = Warrior('전사2', 100, 150);
  w1.iceAttack();
  w2.TwoComboAttack(w1);
}
