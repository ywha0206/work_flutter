import 'package:flutter/material.dart';

void main() {
  runApp(MyStatelessWidget());
}

// stateless
// 상태의 변화 없이 항상 동일한 UI를 그립니다.
// 이런 위젯은 데이터나 변수의 값이 변하지 않을 때 사용합니다

// 포인트!
// 사실 상태는 변수에 할당된 값입니다

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});
  final msg = '안녕하세요 저는 상태가 없는 (고정된) 위젯입니다.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(msg),
      ),
    );
  }
}
