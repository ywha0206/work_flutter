import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  // final Function(String) click; --> 타입 추론 가능하기 때문에 생략 가능
  // 일급객체를 지원하는 문법 검색해보기
  final click;

  const CustomElevatedButton({
    required this.text,
    required this.click,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white12,
      ),
      onPressed: click,
      child: Text('$text'),
    );
  }
}
