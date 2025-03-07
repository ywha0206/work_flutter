import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final FormFieldSetter<String>? onSaved;

  const CustomTextFormField(this.onSaved, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '닉네임을 입력하세요';
        }
        return null;
      },
      // save 호출 시 데이터 저장
      onSaved: onSaved,
    );
  }
}
