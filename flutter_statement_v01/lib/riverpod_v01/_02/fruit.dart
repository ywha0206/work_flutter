import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고안에서 관리할 데이터 선정
// 기본 데이터 타입, 클래스 묶음
String fruit = '사과';

// 2. 창고를 만들자 (fruit store 창고를 만들 때 규격이 다 있다. 그 이름은 statenotifier
class FruitStore extends StateNotifier<String> {
  // super.state 는 전달받은 data를 상태로 등록시키는 과정(바코드 등록)
  FruitStore(super.state);

  // 창고안에는 관리할 상품도 존재할 수 있고, 편하게 관리할 머신도 존재할 수 있다
//창고 안에 데이터를 변경할 수 있는 기능을 만들어 주자

  void changeData(String data) {
    super.state = data;
  }
}

// 3. 창고 관리자에게 창고를 등록하고 관리하도록 설정하자
final fruitProvider = StateNotifierProvider<FruitStore, String>(
  (ref) => FruitStore(fruit),
);
