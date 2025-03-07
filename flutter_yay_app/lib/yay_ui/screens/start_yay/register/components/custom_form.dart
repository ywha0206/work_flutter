import 'package:flutter/material.dart';
import 'package:flutter_yay_app/yay_ui/screens/start_yay/register/components/custom_form_text_field.dart';

class CustomForm extends StatelessWidget {
  // 1. GlobalKey 선언 - 폼 상태를 관리하기 위한 키
  final _formKey = GlobalKey<FormState>();
  // 2. 사용자가 입력한 데이터를 저장하는 멤버 변수 선언
  String _nick = '';

  CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            (value) {
              _nick = value ?? '';
            },
          ),
          const SizedBox(height: 50.0),
          TextButton(
            onPressed: () {
              // 유효성 검사
              if (_formKey.currentState!.validate()) {
                print('Email : ${_nick}');
                // 미리 정해진 라우터 이름을 호출할 수 있다.
                Navigator.pushNamed(context, '/home');
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFF15482D),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                '확인',
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Color(0xFF15482D),
                  height: 4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
