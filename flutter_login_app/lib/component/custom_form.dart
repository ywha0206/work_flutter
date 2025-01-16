import 'package:flutter/material.dart';
import 'package:flutter_login_app/component/custom_text_form_field.dart';
import 'package:flutter_login_app/size.dart';

class CustomForm extends StatelessWidget {
  // 1. GlobalKey 선언 - 폼 상태를 관리하기 위한 키
  final _formKey = GlobalKey<FormState>();
  // 2. 사용자가 입력한 데이터를 저장하는 멤버 변수 선언
  String _email = '';
  String _password = '';

  CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            'Email',
            (value) {
              _email = value ?? '';
            },
          ),
          SizedBox(height: mediumGap),
          CustomTextFormField(
            'Password',
            (value) {
              _password = value ?? '';
            },
          ),
          SizedBox(height: largeGap),
          TextButton(
            onPressed: () {
              // 유효성 검사
              if (_formKey.currentState!.validate()) {
                // 유효성 검사가 다 통과하면 아래 로직 호출
                // save() 메서드를 호출해야 하고
                // 통신 요청
                // 로깅 확인
                print('Email : ${_email}');
                print('Password : ${_password}');
                // 미리 정해진 라우터 이름을 호출할 수 있다.
                Navigator.pushNamed(context, '/home');
              }
            },
            child: Text(
              'Login',
              style:
                  TextStyle(color: Colors.white, backgroundColor: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
