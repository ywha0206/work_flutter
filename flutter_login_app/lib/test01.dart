import 'package:flutter/material.dart';

// 텍스트 필드와 form 위젯 만들어 보기
// 테스트 코드 작업
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: FormPage(),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////
// 변경 가능한 변수를 --> 상태가 있는 위젯이다
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  // 강한 소유 관계
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _username = '';
  String _password = '';

  // 타입 추론
  // 폼 상태를 추적하기 위해 관리하는 고유키를 하나 선언한다.
  // 즉 폼에 상태에 접근할 수 있다. (이 키를 가지고)
  final _formKey = GlobalKey<FormState>();

  //화면을 그리는 메서드
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'username을 입력하시오.';
              }
              print('텍스트 필드 사용자 이름');
              return null;
            },
            onSaved: (value) {
              print('사용자 이름 필드 onSaved 호출됨');
              _username = value!;
            },
          ),
          SizedBox(height: 24.0),
          TextFormField(
            // 패스워드 받을 때 사용하는 속성
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '비밀번호를 입력하시오.';
              }
              return null;
            },
            onSaved: (value) {
              print('사용자 비밀번호 필드 onSaved 호출됨');
            },
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              // 유효성 검사 호출
              if (_formKey.currentState!.validate()) {
                // true 일 경우 들어옴
                print('true를 반환');
                // 저장 메서드 호출
                _formKey.currentState!.save();
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
//////////////////////////////////////////////////
